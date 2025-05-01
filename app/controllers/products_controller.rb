class ProductsController < ApplicationController
  # GET /products or /products.json
  def index
    @categories = Category.all
    @products = Product.all

    if params[:query].present?
      query = "%#{params[:query]}%"
      @products = @products.where("product_name LIKE :query OR description LIKE :query", query: query)
    end
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end
    @products = @products.where(on_sale: true) if params[:on_sale] == "true"
    @products = @products.where("created_at >= ?", 2.hours.ago) if params[:new] == "true"
    @products = @products.order(updated_at: :desc) if params[:recently_updated] == "true"

    @products = @products.page(params[:page]).per(20)
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
