class CartController < ApplicationController
  def show
    session[:cart] ||= {}
    @cart = session[:cart]
  end

  def add_item
    product_id = params[:product_id].to_s

    session[:cart] ||= {}
    session[:cart][product_id] ||= 0
    session[:cart][product_id] += 1

    redirect_to cart_path, notice: "Added #{Product.find(product_id).product_name} to your cart!"
  end

  # Update quantity of item in cart
  def update_quantity
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    if session[:cart] && session[:cart][product_id]
      if quantity.positive?
        session[:cart][product_id] = quantity
        notice = "Updated quantity of #{Product.find(product_id).product_name} to #{quantity}."
      else
        session[:cart].delete(product_id)
        notice = "#{Product.find(product_id).product_name} removed from your cart!"
      end
    else
      notice = "Item not found in cart!"
    end
    redirect_to cart_path, notice: notice
  end

  # Remove item from cart
  def remove_item
    product_id = params[:product_id].to_s
    if session[:cart] && session[:cart][product_id]
      session[:cart].delete(product_id)
      notice = "Removed #{Product.find(product_id).product_name} from your cart!"
    else
      notice = "Item not found in cart!"
    end
    redirect_to cart_path, notice: notice
  end

  def checkout
    session[:cart] ||= {}
    cart = session[:cart]
    if cart.empty?
      redirect_to cart_path, alert: "Your cart is empty!"
      return
    end
    @user = current_user || User.first
    @order = build_order(cart)

    if order.save
      session[:cart] = {}
      stripe_session = create_strip_session(@order)
      redirect_to stripe_session.url, allow_other_host: true
    else
      redirect_to cart_path, alert: "Failed to create order. Please try again."
    end
  end
end

private

def build_order(cart)
  order = iniialize_order
  total = 0
  cart.each do |product_id, quantity|
    product = Product.find_by(id: product_id)
    next unless product

    price = fetch_product_price(product)
    order.order_items.build(product: product, quantity: quantity, price: price)
    total += quantity * price
  end
  order.total_amount = total
  order
end

def initialize_order
  Order.new(user: @user, status: "pending", total_amount: 0, address: @user.full_address)
end

def fetch_product_price(product)
  product.product_prices.last&.price || 0
end

def create_strip_session(order)
  Stripe::Checkout::Session.create(
    payment_method_types: ["card"],
    line_items:           order.order_items.map do |item|
      {
        price_data: {
          currency: "cad", unit_amount: (item.price * 100).to_i,
          product_data: { name: item.product.product_name }
        }, quantity: item.quantity
      }
    end,
    mode: "payment", success_url: "#{root_url}orders/#{order.id}?success=true",
    cancel_url: "#{root_url}cart?canceled=true"
  )
end
