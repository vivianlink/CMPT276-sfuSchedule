class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:color]= "valid"
      session[:user_name] = @user[:username]
      session[:user_id] = @user[:id]
      session[:is_admin] = false
      redirect_to welcome_index_path
    else
      flash[:color]= "invalid"
      flash[:notice] = "Form is invalid"
      render "new"
    end
  end

  def index
    @users = User.all
  end

  def show
    if session[:user_id].present?
      @user = User.find(session[:user_id])
    end
  end

  def remove
    @currUser = User.find(session[:user_id])
    @delCourse = @currUser.course.find(params[:id])
    @currUser.course.delete(@delCourse)
    redirect_to :back
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
