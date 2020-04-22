# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]

  def new; end

  def create
    @user = User.find_by(username: sign_in_params[:username])
    if @user&.authenticate(sign_in_params[:password])
      session[:user_id] = @user.id
      redirect_to chatrooms_path,
                  flash: { success: "Welcome back #{@user.username}" }
    else
      flash.now[:error] =
        'There was something wrong with credentials you specified.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, flash: { success: 'See you later!' }
  end

  def sign_in_params
    params.require(:session).permit(:username, :password)
  end

  private

  def logged_in_redirect
    return unless logged_in?

    redirect_to root_path,
                flash: { error: 'You are already logged in.' }
  end
end
