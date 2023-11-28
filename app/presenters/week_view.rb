# frozen_string_literal: true

class WeekView < TimeView
  def name
    'Week'
  end

  def start_on
    ref_date.at_beginning_of_week
  end

  def end_on
    ref_date.at_end_of_week
  end
end
