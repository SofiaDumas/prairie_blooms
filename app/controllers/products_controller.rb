class ProductsController < ApplicationController
  # before_action :set_product, only: [ :show ]

  # GET /products or /products.json
  def index
    @products = Product.page(params[:page]).per(20)
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_name, :description, :stock_quantity, :category_id)
    end
end
