# frozen_string_literal: true

class WeekView < TimeView
  def name
    'Week'
  end

  def end_at
    (start_at + 7).at_end_of_day
  end
end
