# frozen_string_literal: true

# A generated report for a user
class Report
  attr_reader :user, :start_at, :end_at, :name

  def self.this_week(user)
    new(user, start_at: Date.today.at_beginning_of_week, end_at: Date.today.at_end_of_week)
  end

  def self.billable_amount(entry_ids)
    TimeEntry.where(id: entry_ids).select(:minutes, :project_id).reduce(0) do |sum, entry|
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

  def initialize(user, start_at:, end_at:, name: nil)
    @user           = user
    @start_at       = start_at.at_beginning_of_day
    @end_at         = end_at.at_end_of_day
    @name           = name
    @total_duration = nil
  end

  def entries
    user.time_entries.where('time_entries.created_at BETWEEN ? and ?', start_at, end_at)
  end

  def entry_ids
    @entry_ids ||= entries.pluck(:id)
  end

  def entries_by_group_name
    entries.includes(project: :group).group_by { |e| e.group.name }
  end

  def entries_by_project_name
    entries.includes(project: :group).group_by { |e| e.project.to_s(:with_group) }
  end

  def total_duration
    @total_duration ||= entries.select(:minutes, :project_id).map(&:duration).reduce(Duration.zero, :+).round
  end

  def billable_duration
    entries
      .joins(:project)
      .select(:minutes, :project_id)
      .where('projects.billable = true')
      .map(&:duration)
      .reduce(Duration.zero, :+)
      .round
  end

  def non_billable_duration
    entries
      .joins(:project)
      .select(:minutes, :project_id)
      .where('projects.billable = false')
      .map(&:duration)
      .reduce(Duration.zero, :+)
      .round
  end

  def billable_amount
    self.class.billable_amount(entry_ids)
  end

  def billable_percentage
    self.class.billable_percentage(entry_ids)
  end

  def billable_ratio
    self.class.billable_ratio(entry_ids)
  end
end
