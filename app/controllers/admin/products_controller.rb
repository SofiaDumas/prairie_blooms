class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]
  def index
    @products = Product.page(params[:page]).per(20)
  end

  def new
    @product = Product.new
    @product.product_prices.build
  end

  def create
    @product = Product.new(product_params)
    @product.product_prices.each do |pp|
      pp.effective_date ||= Date.today
    end
    if @product.save
      redirect_to admin_products_path, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
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
    params.require(:product).permit(
      :product_name, :description, :stock_quantity, :category_id, product_prices_attributes: [ :id, :price ])
  end
end
