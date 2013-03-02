class ApplicationController < ActionController::Base
  protect_from_forgery

	private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 
  helper_method :current_user
    
  def require_user
    current_user or (redirect_to("/auth/facebook") and return)
    unless current_user.active
      redirect_to terms_path
    end
  end
  
  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin
  
  def require_admin
    current_admin or redirect_to( admin_login_path, notice: "You need administrative privalages to acsess that page" )
  end
	
end
