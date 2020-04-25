# frozen_string_literal: true

class FriendRequestsController < ApplicationController
  def new
    @users = search_for_users
  end

  private

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
