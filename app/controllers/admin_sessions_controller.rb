class AdminSessionsController < ApplicationController
  def new
  end 

  def create
    admin = Admin.authenticate(params[:user_name], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to new_blog_path, :notice => "Logged in as an admin!"
    else
      flash.now.alert = "Invalid user name or password"
      render "new"
    end
  end
  
  def destroy
    session[:admin_id] = nil
    redirect_to root_url, :notice => "Logged out of admin acount!"
  end
end
