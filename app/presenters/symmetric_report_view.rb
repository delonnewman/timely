# frozen_string_literal: true

# An abstract class for report views that can move forward an backward in time by some symmetry
# (e.g. week, month, quarter, year, etc.).  Subclasses should implement #next and #prev.
class SymmetricReportView < ReportView
  def self.current(user)
    new(user, start_on: current_start_date, end_on: current_end_date)
  end

  def self.current_start_date
    raise NotImplementedError
  end

  def self.current_end_date
    raise NotImplementedError
  end

  def symmetric?
    true
  end

  def title_prefix
    return "This #{kind}" if current?
    return "Next #{kind}" if next?
    return "Last #{kind}" if last?

    kind.capitalize
  end

  def next
    self.class.new(user, start_on: next_start_date, end_on: next_end_date)
  end

  def next_start_date
    raise NotImplementedError
  end

  def next_end_date
    raise NotImplementedError
  end

  def prev
    self.class.new(user, start_on: prev_start_date, end_on: prev_end_date)
  end

  def prev_start_date
    raise NotImplementedError
  end

  def prev_end_date
    raise NotImplementedError
  end

  def next?
    raise NotImplementedError
  end

  def last?
    raise NotImplementedError
  end
end
