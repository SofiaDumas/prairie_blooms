class StoreController < ApplicationController
  before_action :check_admin, only: %i[show edit update]

  # GET /store or /store.json
  def index
    @store = Store.first
  end

  # GET /store/1 or /store/1.json
  def show
    @store = Store.first
  end

  # GET /store/1/edit
  def edit
    @store = Store.first
  end

  # PATCH/PUT /store/1 or /store/1.json
  def update
    @store = Store.first
    if @store.update(store_params)
      redirect_to store_path, notice: "Store was successfully updated."
    else
      render :edit
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def store_params
    params.require(:store).permit(:name, :description, :logo_url, :contact_email, :phone)
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end
