# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Message.Me #{@user.username}!"
      redirect_to chatrooms_path
    else
      render 'new'
    end
  end

  private

  def user_params
    permitted = %i[username email password]
    params.require(:user).permit(*permitted)
  end
end
