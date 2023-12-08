# frozen_string_literal: true

# Present report data for the user within the start and end dates.
class ReportView
  attr_reader :user, :start_on, :end_on

  delegate :total_duration, :billable_amount, :billable_percentage, :billable_ratio, to: :report
  delegate :entries, :entries_by_group_name, to: :report

  def self.[](kind)
    return self if [:custom, 'custom'].include?(kind)

    "#{kind}_report_view".classify.constantize
  end

  def self.build(user, start_on: nil, end_on: nil)
    return current(user) unless start_on && end_on

    new(user, start_on:, end_on:)
  end

  def self.current(user)
    raise NotImplementedError
  end

  def initialize(user, start_on:, end_on:)
    @user     = user
    @start_on = start_on.to_date
    @end_on   = end_on.to_date
  end

  def title
    "#{title_prefix}: #{formatted_start_date} - #{formatted_end_date}"
  end

  def title_prefix
    'Custom'
  end

  def formatted_start_date
    return start_on.strftime('%d') if start_on.same_month?(end_on)
    return start_on.strftime('%d %b') if start_on.same_year?(end_on)

    start_on.strftime('%d %b %Y')
  end

  def formatted_end_date
    end_on.strftime('%d %b %Y')
  end

  def report
    @report ||= Report.new(user, start_at:, end_at:)
  end

  def start_at
    return unless start_on

    start_on.at_beginning_of_day
  end

  def end_at
    return unless end_on

    end_on.at_end_of_day
  end

  def date_range
    start_on..end_on
  end

  def current?
    date_range.include?(Date.today)
  end

  def entry_groupings
    entries_by_group_name.lazy.map do |(name, entries)|
      ReportGroupingView.new(name, entries)
    end
  end

  def symmetric?
    false
  end

  def kind
    'custom'
  end
end
