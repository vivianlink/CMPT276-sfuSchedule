class AdminController < ApplicationController
  def new
  end

  def become_admin_attempt
    if (params[:admin_password] == "cmpt276admin")
      flash[:notice] = "You are now an administrator of SFU Planner"
      #session[:user_name] = authorized_user.username
      redirect_to welcome_index_path
    else
      flash[:notice] = "Unable to authenticate"
      flash[:color]= "invalid"
      render "new"	
    end
  end

end

  