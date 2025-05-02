module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin
    def index
      @orders = Order.all.includes(:user, :order_items).order("created_at DESC")
      @total_users = User.count
      @total_sales = Order.sum(:total_amount)
      @total_orders = Order.count
      @status_orders = Order.where(status: "pending")
      @low_stock_products = Product.where("stock_quantity <?", 5)
    end

    private

    def check_admin
      return if current_user.admin?

      redirect_to root_path, alert: "Access Denied. Only Administrators access."
    end
  end
end
