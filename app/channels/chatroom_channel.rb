# frozen_string_literal: true

class ChatroomChannel < ApplicationCable::Channel
  def chatroom
    Chatroom.find(params[:chatroom_id])
  end

  def subscribed
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
