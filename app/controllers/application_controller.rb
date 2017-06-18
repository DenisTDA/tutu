class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_lists_path
    else
      search_path
    end
  end

private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :lastname)
  end
 
  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :lastname)
  end
end
