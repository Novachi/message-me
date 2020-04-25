# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true

  scope :custom_display, -> { order(:created_at).last(20) }

  def self.date_messages_mapping(messages)
    dates = messages.pluck(:created_at).map { |time| time.strftime('%d/%m/%Y') }.uniq
    mapping = {}
    dates.each do |date|
      mapping[date] = messages.select { |message| message.created_at.strftime('%d/%m/%Y') == date }
    end
    mapping
  end
end
