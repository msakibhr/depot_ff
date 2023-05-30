class ApplicationController < ActionController::Base
  before_action :authenticate_user!



  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


  private

  def require_admin
    unless current_user && current_user.role == 'admin'
      # redirect_to root_path, alert: 'Access denied.'
      redirect_to store_index_path, alert: 'Access denied.'
    end
  end
end
