# frozen_string_literal: true

class UserFriendList < ApplicationRecord
  belongs_to :friend_list
  belongs_to :user
end
