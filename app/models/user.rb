# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :username,
            presence: true,
            length: { minimum: 2 },
            uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  has_many :messages
end
