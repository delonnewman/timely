# frozen_string_literal: true

# Presents project data in time sequence
class TimeView
  delegate :empty?, :exists?, :none?, to: :entries

  def self.[](name)
    "#{name}_time_view".classify.constantize
  end

  def initialize(user, params)
    @user = user
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

  def today?
    same_date?(Date.today)
  end

  def same_date?(date)
    ref_date == date
  end

  def date_range
    start_at.to_date.beginning_of_week..end_at.to_date.end_of_week
  end

  def name
    raise NotImplementedError
  end

  def week_total_duration
    duration(start_at.at_beginning_of_week, end_at.at_end_of_week)
  end

  def entries
    query(start_at, end_at)
  end

  def duration(start_at, end_at)
    query(start_at, end_at).map(&:duration).sum(Duration.zero)
  end

  def query(start_at, end_at)
    TimeEntry
      .includes(project: :group)
      .where(user_id: user.id)
      .where('created_at BETWEEN ? AND ?', start_at, end_at)
      .order(minutes: :desc)
  end

  def start_at
    start_on.at_beginning_of_day
  end

  def end_at
    end_on.at_end_of_day
  end

  def ref_date
    Date.new(year, month, day)
  end
  alias start_on ref_date
  alias end_on ref_date

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

  attr_reader :user, :params
end
