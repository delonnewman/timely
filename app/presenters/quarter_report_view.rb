# frozen_string_literal: true

# Report on time entries a quarter at a time
class QuarterReportView < SymmetricReportView
  def self.current_start_date
    Date.today.at_beginning_of_quarter
  end

  def self.current_end_date
    Date.today.at_end_of_quarter
  end

  def next_start_date
    start_on.next_quarter.at_beginning_of_quarter
  end

  def next_end_date
    end_on.next_quarter.at_end_of_quarter
  end

  def prev_start_date
    start_on.prev_quarter.at_beginning_of_quarter
  end

  def prev_end_date
    end_on.prev_quarter.at_end_of_quarter
  end

  def next?
    date_range.include?(Date.today.next_quarter)
  end

  def last?
    date_range.include?(Date.today.prev_quarter)
  end

  def kind
    'quarter'
  end
end
