# frozen_string_literal: true

# A generated report for the given projects
class Report
  attr_reader :project_ids, :start_at, :end_at, :name

  def self.this_week(project_ids)
    new(project_ids, start_at: Date.today.at_beginning_of_week, end_at: Date.today.at_end_of_week)
  end

  def initialize(project_ids, start_at:, end_at:, name: nil)
    @project_ids    = project_ids
    @start_at       = start_at.at_beginning_of_day
    @end_at         = end_at.at_end_of_day
    @name           = name
    @total_duration = nil
  end

  def entries
    TimeEntry.where(project_id: project_ids).within(start_at..end_at)
  end

  def build_grouping(name)
    Grouping.build(name:, report: self)
  end

  def entry_ids
    @entry_ids ||= entries.pluck(:id)
  end

  def total_duration
    @total_duration ||= entries.select(:minutes, :project_id).map(&:duration).sum(Duration.zero).round
  end

  def billable_duration
    duration_by_billability(billable: true)
  end

  def non_billable_duration
    duration_by_billability(billable: false)
  end

  def duration_by_billability(billable:)
    entries
      .by_billability(billable)
      .select(:minutes, :project_id)
      .map(&:duration)
      .sum(Duration.zero)
      .round
  end

  def billable_amount
    TimeEntryCalculation.billable_amount(entry_ids)
  end

  def billable_percentage
    TimeEntryCalculation.billable_percentage(entry_ids)
  end

  def billable_ratio
    TimeEntryCalculation.billable_ratio(entry_ids)
  end
end
