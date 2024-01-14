module DateRange
  def self.today
    Date.today.at_beginning_of_day..Date.today.at_end_of_day
  end

  def self.this_week
    Date.today.at_beginning_of_week..Date.today.at_end_of_week
  end

  def self.last_week
    Date.today.prev_week.at_beginning_of_week..Date.today.prev_week.at_end_of_week
  end

  def self.this_semimonth
    Date.today.at_beginning_of_semimonth..Date.today.at_end_of_semimonth
  end

  def self.this_month
    Date.today.at_beginning_of_month..Date.today.at_end_of_month
  end

  def self.this_quarter
    Date.today.at_beginning_of_quarter..Date.today.at_end_of_quarter
  end

  def self.this_year
    Date.today.at_beginning_of_year..Date.today.at_end_of_year
  end
end
