# frozen_string_literal: true

class DayView < TimeView
  def name
    'Day'
  end

  def end_at
    start_at.at_end_of_day
  end
end
