# frozen_string_literal: true

# A generated report for a project
class Report
  attr_reader :project, :start_at, :end_at

  def initialize(project, start_at:, end_at:)
    @project        = project
    @start_at       = start_at.at_beginning_of_day
    @end_at         = end_at.at_end_of_day
    @total_duration = nil
  end

  def entries
    project.time_entries.where('created_at BETWEEN ? and ?', start_at, end_at)
  end

  def total_duration
    @total_duration ||= entries.select(:minutes, :project_id).map(&:duration).reduce(:+)
  end

  def gross_income
    project.pay_rate * total_duration
  end
end
