class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only [:mark_as_shipped]
  def index
    @orders = Order.all.includes(:order_items)
  end

  def mark_as_shipped
    if @order.status == "paid"
      @order.update(status: "shipped")
      redirect_to admin_order_path, notice: "Order ##{@order.id} markes as shipped"
    else
      redirect_to admin_order_path, alert: "Only paid orders can be shipped"
    end
  end

  private
  def set_order
    @order = Order.find{params[:id]}
  end
end
