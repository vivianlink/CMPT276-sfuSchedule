class SessionsController < ApplicationController
  def login
    #Login Form
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      flash[:notice] = "Welcome again, you logged in as #{authorized_user.username}"
      session[:user_name] = authorized_user.username
      session[:user_id] = authorized_user.id

      if authorized_user.is_admin
        session[:is_admin] = true
        flash[:notice] = flash[:notice] + ", and you are an admin"
      else
        session[:is_admin] = false
      end

      redirect_to welcome_index_path
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"	
    end
  end

  def logout
      flash[:notice] = "Bye, #{session[:user_name]}. See you later!"
	    session[:user_name] = nil
      session[:user_id] = nil
      session[:is_admin] = false
      redirect_to welcome_index_path
  end
end