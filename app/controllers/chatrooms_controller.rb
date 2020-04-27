# frozen_string_literal: true

class ChatroomsController < ApplicationController
  before_action :require_user

  def index
    return unless Chatroom.last_updated_chatroom(current_user.id)

    redirect_to chatroom_path(Chatroom.last_updated_chatroom(current_user.id))
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    messages = @chatroom.messages.custom_display
    @date_messages_mapping = Message.date_messages_mapping(messages)
  end
end
