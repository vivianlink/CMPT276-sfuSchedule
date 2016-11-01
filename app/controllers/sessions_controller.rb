class SessionsController < ApplicationController
  def login
    #Login Form
  end
  
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      flash[:notice] = "Welcome again, you logged in as #{authorized_user.username}"
      redirect_to welcome_index_path
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"	
    end
  end
end