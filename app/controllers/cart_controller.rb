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
    user = User.first
    order = Order.new(user: user, status: "pending", total_amount: 0, address: user.address)
    total = 0
    cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product
      price = product.product_prices.last&.price || 0
      order.order_items.create(product: product, quantity: quantity, price: price)
      total += qunatity * price
    end
    order.update(total_amount: total)
    order.payments.create(payment_method: "credit_card", amount: total, payment_status: "completed")
    order.update(status: "paid")
    session[:cart] = {}
    redirect_to orders_path, notice: "Order was successfully created."
  end
end
