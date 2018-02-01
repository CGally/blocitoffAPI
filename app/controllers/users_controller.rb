class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @item = Item.new
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)

    if @user.save
      flash[:notice] = "user was updated."
      redirect_to current_user
    else
      flash.now[:alert] = "There was an error saving the user. Please try again."
      redirect_to current_user
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :private)
  end
end
