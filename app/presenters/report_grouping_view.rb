# frozen_string_literal: true

class ReportGroupingView
  attr_reader :name

  delegate :count, :size, :length, to: :entries

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

  def entries
    @entries.lazy.map do |entry|
      ReportGroupingEntryView.new(entry)
    end
  end

  def duration
    @entries.map(&:round).sum(Duration.zero)
  end

  def billable_amount?
    !billable_amount.zero?
  end

  def billable_amount
    @billable_amount ||= TimeEntry.billable_amount(entry_ids)
  end

  def billable_percentage
    @billable_percentage ||= TimeEntry.billable_percentage(entry_ids)
  end
end
