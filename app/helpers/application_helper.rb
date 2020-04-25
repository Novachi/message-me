# frozen_string_literal: true

module ApplicationHelper
  def formatted_time(time)
    time.strftime('%d/%m/%y %H:%M:%S')
  end
end
