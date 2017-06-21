class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_dashboard_path
    else
      search_path
    end
  end

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :email, :password, :password_confirmation])
  end
end
