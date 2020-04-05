class UsersController < ApplicationController

  def new
    # byebug
    @user = User.new
  end

  def create
    # byebug
    @user = User.new(user_params)
    user = params.require(:users)[:username]
    if @user.save
      session[:user_id] = User.last.id
      flash[:success] = "Welcome to the Message Me App #{user}"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your signup details"
      render 'new'
    end
  end

  private
  def user_params
    params.require(:users).permit(:username, :password)
  end
end