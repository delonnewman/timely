# frozen_string_literal: true

class Date
  def at_beginning_of_semimonth
    return Date.new(year, month, 1) if day < 16

    Date.new(year, month, 16)
  end
  alias beginning_of_semimonth at_beginning_of_semimonth

  def at_end_of_semimonth
    return Date.new(year, month, 15) if day < 16

    at_end_of_month
  end
  alias end_of_semimonth at_end_of_semimonth

  def next_semimonth
    return Date.new(year, month, 16) if day < 16

    next_month.at_beginning_of_month
  end

  def prev_semimonth
    return beginning_of_month if day > 15

    d = prev_month
    Date.new(d.year, d.month, 16)
  end

  def same_month?(date)
    month == date.month && year == date.year
  end

  def same_year?(date)
    year == date.year
  end
end
