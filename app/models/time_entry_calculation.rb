# frozen_string_literal: true

# Perform calculations for time entries
module TimeEntryCalculation
  def self.billable_amount(entry_ids)
    TimeEntry.includes(:project).where(id: entry_ids).select(:minutes, :project_id).reduce(0) do |sum, entry|
      sum + entry.billable_amount
    end
  end

  def self.billable_percentage(entry_ids)
    billable_ratio(entry_ids) * 100
  end

  def self.billable_ratio(entry_ids)
    data         = billable_data(entry_ids)
    billable     = (data[true] || 0.0).to_f
    non_billable = (data[false] || 0.0).to_f
    total        = billable + non_billable
    return 0.0 if total.zero?

    billable / total
  end

  def self.billable_data(entry_ids)
    TimeEntry
      .where(id: entry_ids)
      .joins(:project)
      .select('projects.billable')
      .group('projects.billable')
      .count
  end
end
