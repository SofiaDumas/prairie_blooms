class ProductPricesController < ApplicationController
  before_action :set_product_price, only: %i[show edit update destroy]

  # GET /product_prices or /product_prices.json
  def index
    @product_prices = ProductPrice.all
  end

  # GET /product_prices/1 or /product_prices/1.json
  def show
    # No need
  end

  # GET /product_prices/new
  def new
    @product_price = ProductPrice.new
  end

  # GET /product_prices/1/edit
  def edit
    # No need
  end

  # POST /product_prices or /product_prices.json
  def create
    @product_price = ProductPrice.new(product_price_params)

    respond_to do |format|
      if @product_price.save
        format.html do
          redirect_to @product_price, notice: "Product price was successfully created."
        end
        format.json { render :show, status: :created, location: @product_price }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_prices/1 or /product_prices/1.json
  def update
    respond_to do |format|
      if @product_price.update(product_price_params)
        format.html do
          redirect_to @product_price, notice: "Product price was successfully updated."
        end
        format.json { render :show, status: :ok, location: @product_price }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_prices/1 or /product_prices/1.json
  def destroy
    @product_price.destroy!

    respond_to do |format|
      format.html do
        redirect_to product_prices_path, status: :see_other,
                                         notice: "Product price was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_price
    @product_price = ProductPrice.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def product_price_params
    params.expect(product_price: %i[product_id price effective_date])
  end
end
