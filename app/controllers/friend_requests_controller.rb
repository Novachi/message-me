# frozen_string_literal: true

class FriendRequestsController < ApplicationController
  def new
    @users = search_for_users
  end

  def create
    unless FriendRequest.where(request_sender_id: current_user.id).first
      FriendRequest.create(friend_request_params)
    end

    redirect_to chatrooms_path, flash: { success: 'Friend request sent!' }
  end

  private

  def friend_request_params
    params
      .require(:friend_request)
      .permit(:user_id)
      .merge(request_sender_id: current_user.id)
  end

  def search_for_users
    if params[:query_string]
      UsersQuery.new(query_string: params[:query_string].presence)
                .call
                .reject { |user| user.id == current_user.id }
    else
      []
    end
  end
end
