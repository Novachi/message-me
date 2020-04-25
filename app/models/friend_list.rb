# frozen_string_literal: true

class FriendList < ApplicationRecord
  belongs_to :user
  has_many :user_friend_lists
  has_many :users, through: :user_friend_lists
end
