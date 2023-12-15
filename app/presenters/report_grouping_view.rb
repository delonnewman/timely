# frozen_string_literal: true

class ReportGroupingView
  attr_reader :name, :entries

  def initialize(name, entries)
    @name                = name
    @entries             = entries
    @entry_ids           = nil
    @billable_amount     = nil
    @billable_percentage = nil
  end

  def entry_ids
    @entry_ids ||= entries.map(&:id)
  end

  def duration
    entries.map(&:round).reduce(Duration.zero, :+)
  end

  def billable_amount?
    !billable_amount.zero?
  end

  def billable_amount
    @billable_amount ||= Report.billable_amount(entry_ids)
  end

  def billable_percentage
    @billable_percentage ||= Report.billable_percentage(entry_ids)
  end
end
