class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]
  def index
    @products = Product.page(params[:page]).per(20)
  end

  def new
    @product = Product.new
  end

  def create
    @products = Product.new(product_params)
    redirect_to admin_products_path, notice: "Product was successfully created."
  end

  def update
    @prodcuts = Product.update(product_params)
    redirect_to admin_products_path, notice: "Product was successfully updated."
  end

  def destroy
    @product.destroy!
    redirect_to admin_products_path, status: :see_other, notice: "Product was successfully destroyed."
  end
  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Access Denied. Only Administrators access."
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:product_name, :description, :stock_quantity, :price)
  end
end
