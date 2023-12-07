# frozen_string_literal: true

# Report on time entries a month at a time
class MonthReportView < SymmetricReportView
  def self.current_start_date
    Date.today.at_beginning_of_month
  end

  def self.current_end_date
    Date.today.at_end_of_month
  end

  def next_start_date
    start_on.next_month.at_beginning_of_month
  end

  def next_end_date
    end_on.next_month.at_end_of_month
  end

  def prev_start_date
    start_on.prev_month.at_beginning_of_month
  end

  def prev_end_date
    end_on.prev_month.at_end_of_month
  end

  def next?
    date_range.include?(Date.today.next_month)
  end

  def last?
    date_range.include?(Date.today.prev_month)
  end

  def kind
    'month'
  end
end
