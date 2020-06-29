# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :require_user

  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      ActionCable.server.broadcast @message.chatroom, message: message_render
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :chatroom_id)
  end

  def message_render
    render partial: 'message', locals: { message: @message }
  end
end
