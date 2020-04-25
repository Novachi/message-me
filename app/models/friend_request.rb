# frozen_string_literal: true

class FriendRequest < ApplicationRecord
  belongs_to :user

  def sender
    User.find(request_sender_id)
  end
end
