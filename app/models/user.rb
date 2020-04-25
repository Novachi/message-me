# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :username,
            presence: true,
            length: { minimum: 2 },
            uniqueness: { case_sensitive: false }
  validates :email,
            presence: true,
            length: { minimum: 2 },
            uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  has_many :messages

  has_one :friend_list
  has_many :user_friend_lists
  has_many :friend_lists, through: :user_friend_lists
  has_many :friend_requests

  def friends
    friend_list.users
  end
end
