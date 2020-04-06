# frozen_string_literal: true

class SessionsController < ApplicationController
  def login; end

  def sign_in
    p = params.permit(:username, :password)
    if p[:username] == 'admin' && p[:password] == 'admin'
      redirect_to chatrooms_path
    end
  end
end
