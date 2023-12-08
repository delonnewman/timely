# frozen_string_literal: true

# Report on time entries a week at a time
class WeekReportView < SymmetricReportView
  def self.current_start_date
    Date.today.at_beginning_of_week
  end

  def self.current_end_date
    Date.today.at_end_of_week
  end

  def next_start_date
    start_on.next_week.at_beginning_of_week
  end

  def next_end_date
    end_on.next_week.at_end_of_week
  end

  def prev_start_date
    start_on.prev_week.at_beginning_of_week
  end

  def prev_end_date
    end_on.prev_week.at_end_of_week
  end

  def next?
    date_range.include?(Date.today.next_week)
  end

  def last?
    date_range.include?(Date.today.prev_week)
  end

  def kind
    'week'
  end
end
