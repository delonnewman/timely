# frozen_string_literal: true

class Date
  def at_beginning_of_semimonth
    return Date.new(year, month, 1) if day <= 15

    Date.new(year, month, 15)
  end

  def at_end_of_semimonth
    return Date.new(year, month, 15) if day <= 15

    at_end_of_month
  end

  def next_semimonth
    self + 15
  end

  def prev_semimonth
    self - 15
  end

  def same_month?(date)
    month == date.month && year == date.year
  end

  def same_year?(date)
    year == date.year
  end
end
