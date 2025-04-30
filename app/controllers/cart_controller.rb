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
      if quantity > 0
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
    user = current_user || User.first
    order = Order.new(user: user, status: "pending", total_amount: 0, address: user.full_address)
    total = 0
    cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product
      price = product.product_prices.last&.price || 0
      order.order_items.build(product: product, quantity: quantity, price: price)
      total += quantity * price
    end
    order.total_amount = total
    order.status = "paid"
    if order.save
      order.payments.create(payment_method: "credit_card", amount: total, payment_status: "completed")
      session[:cart] = {}
      redirect_to orders_path, notice: "Order was successfully created."
    else
      redirect_to cart_path, alert: "Failed to create order. Please try again."
    end
  end
end
