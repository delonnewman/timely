# frozen_string_literal: true

class DayTimeView < TimeView
  def name
    'Day'
  end

  def start_at
    ref_date.at_beginning_of_day
  end

  def end_at
    ref_date.at_end_of_day
  end
end
