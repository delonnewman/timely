# frozen_string_literal: true

class TimeView
  def self.[](name)
    "#{name}_view".classify.constantize
  end

  def initialize(project_ids, params)
    @project_ids = project_ids
    @params = params
  end

  def date_totals
    date_range.each_with_object({}) do |date, dates|
      dates[date] = duration(date.at_beginning_of_day, date.at_end_of_day)
    end
  end

  def next_week
    start_at.to_date + 7
  end

  def prev_week
    start_at.to_date - 7
  end

  def same_date?(date)
    start_at.to_date == date
  end

  def date_range
    start_at.to_date.beginning_of_week..end_at.to_date.end_of_week
  end

  def name
    raise NotImplementedError
  end

  def total_duration
    duration(start_at, end_at)
  end

  def entries
    query(start_at, end_at)
  end

  def duration(start_at, end_at)
    query(start_at, end_at).map(&:duration).reduce(:+) || Duration.zero
  end

  def query(start_at, end_at)
    TimeEntry
      .includes(project: :group)
      .where(project_id: project_ids)
      .where('created_at BETWEEN ? AND ?', start_at, end_at)
  end

  def start_at
    start_on.at_beginning_of_day
  end

  def start_on
    raise NotImplementedError
  end

  def end_at
    end_on.at_end_of_day
  end

  def end_on
    raise NotImplementedError
  end

  def ref_date
    Date.new(year, month, day)
  end

  def year
    params.fetch(:year, Date.today.year).to_i
  end

  def month
    params.fetch(:month, Date.today.month).to_i
  end

  def day
    params.fetch(:day, Date.today.day).to_i
  end

  private

  attr_reader :project_ids, :params
end
