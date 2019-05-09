class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  def logged_in_user
    return if user_signed_in?
    store_location
    flash[:danger] = "Vui Long Dang Nhap"
    redirect_to new_user_session_path
  end

  protected

  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up) do |u|
	  u.permit :name, :email,:password, :password_confirmation, :address, :phone_number, :role
	end

	devise_parameter_sanitizer.permit(:account_update) do |u|
	  u.permit :name, :email,:password, :password_confirmation, :address, :phone_number, :current_password
	end
  end
end
