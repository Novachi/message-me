# frozen_string_literal: true

class FriendRequestsController < ApplicationController
  def index
    @friend_requests = current_user.friend_requests
  end

  def new
    @users = search_for_users
  end

  def create
    unless FriendRequest.where(request_sender_id: current_user.id).first
      FriendRequest.create(friend_request_params)
    end

    redirect_to user_friend_requests_path(current_user),
                flash: { success: 'Friend request sent!' }
  end

  def accept
    friend_request = FriendRequest.find(params[:friend_request_id])
    update_friend_lists(friend_request)
    friend_request.destroy

    redirect_to user_friend_requests_path(current_user),
                flash: { success: 'Friend request accepted!' }
  end

  def destroy
    FriendRequest.find(params[:id]).destroy

    redirect_to user_friend_requests_path(current_user),
                flash: { success: 'Friend request declined!' }
  end

  private

  def update_friend_lists(friend_request)
    current_user.friend_list.users << friend_request.sender
    friend_request.sender.friend_list.users << current_user
  end

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
                .reject do |user|
                  user.id == current_user.id ||
                    current_user.friend_list.user_ids.include?(user.id)
                end
    else
      []
    end
  end
end
