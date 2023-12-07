# frozen_string_literal: true

# Report on time entries a semimonth at a time
class SemimonthReportView < SymmetricReportView
  def self.current_start_date
    Date.today.at_beginning_of_semimonth
  end

  def self.current_end_date
    Date.today.at_end_of_semimonth
  end

  def next_start_date
    start_on.next_semimonth.at_beginning_of_semimonth
  end

  def next_end_date
    end_on.next_semimonth.at_end_of_semimonth
  end

  def prev_start_date
    start_on.prev_semimonth.at_beginning_of_semimonth
  end

  def prev_end_date
    end_on.prev_semimonth.at_end_of_semimonth
  end

  def next?
    date_range.include?(Date.today.next_semimonth)
  end

  def last?
    date_range.include?(Date.today.prev_semimonth)
  end

  def kind
    'semimonth'
  end
end
