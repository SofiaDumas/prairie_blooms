class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :street, :city, :postal_code, :province, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  def after_sign_in_path_for(resource)
    cart_path
  end

  def after_sign_up_path_for(resource)
    cart_path
  end
end
