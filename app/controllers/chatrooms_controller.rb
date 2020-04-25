# frozen_string_literal: true

class ChatroomsController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    messages = Message.custom_display
    @date_messages_mapping = Message.date_messages_mapping(messages)
  end
end
