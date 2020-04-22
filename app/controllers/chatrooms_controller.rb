# frozen_string_literal: true

class ChatroomsController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @messages = Message.custom_display
  end
end
