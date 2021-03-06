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
  has_many :messages, dependent: :destroy

  has_one :friend_list, dependent: :destroy
  has_many :user_friend_lists
  has_many :friend_lists, through: :user_friend_lists
  has_many :users, through: :friend_list, source: :users
  has_many :friend_requests
  has_and_belongs_to_many :chatrooms

  alias friends users
end
