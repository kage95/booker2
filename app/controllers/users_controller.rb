class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user  = current_user
  end
  
  def show
    @login_user = current_user
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
end
