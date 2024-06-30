# Some useful time ranges
module TimeRange
  def self.today
    Date.today.at_beginning_of_day.in_time_zone..Date.today.at_end_of_day.in_time_zone
  end

  def self.this_week
    Date.today.at_beginning_of_week.in_time_zone..Date.today.at_end_of_week.in_time_zone
  end

  def self.last_week
    Date.today.prev_week.at_beginning_of_week.in_time_zone..Date.today.prev_week.at_end_of_week.in_time_zone
  end

  def self.this_semimonth
    Date.today.at_beginning_of_semimonth.in_time_zone..Date.today.at_end_of_semimonth.in_time_zone
  end

  def self.this_month
    Date.today.at_beginning_of_month.in_time_zone..Date.today.at_end_of_month.in_time_zone
  end

  def self.this_quarter
    Date.today.at_beginning_of_quarter.in_time_zone..Date.today.at_end_of_quarter.in_time_zone
  end

  def self.this_year
    Date.today.at_beginning_of_year.in_time_zone..Date.today.at_end_of_year.in_time_zone
  end
end
