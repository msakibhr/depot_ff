class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def require_admin
    unless current_user && current_user.role == 'admin'
      # redirect_to root_path, alert: 'Access denied.'
      redirect_to store_index_path, alert: 'Access denied.'
    end
  end
end
