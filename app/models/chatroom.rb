# frozen_string_literal: true

class Chatroom < ApplicationRecord
  has_many :messages
  has_and_belongs_to_many :users

  def self.for_users(user_ids)
    Chatroom.joins(:chatrooms_users)
            .where(chatrooms_users: { user_id: user_ids.first })
            .select { |cr| (cr.user_ids - user_ids).blank? }
            .first
  end

  def self.last_updated_chatroom(user_id)
    Chatroom.joins(:chatrooms_users)
            .where(chatrooms_users: { user_id: user_id })
            .order(:updated_at)
            .last
  end
end
