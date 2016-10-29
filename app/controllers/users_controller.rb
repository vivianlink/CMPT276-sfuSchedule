class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to users_path
    else
      flash[:color]= "invalid" 
      flash[:notice] = "Form is invalid"
    end 
      #render "new"
  end

  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end 

  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

end