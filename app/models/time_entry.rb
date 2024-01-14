# An entry of recorded minutes in a project
class TimeEntry < ApplicationRecord
  belongs_to :user

  belongs_to :project
  delegate :rounding_factor, :pay_rate, :billable?, to: :project
  has_one :group, through: :project

  validates :minutes, presence: true, numericality: { only_integer: true, greater_than: 0 }
  composed_of :duration, mapping: { minutes: :minutes }, converter: ->(minutes) { Duration[minutes] }

  scope :for_projects, ->(projects) { includes(:project).where(project: projects) }
  scope :by_billability, ->(billable) { joins(:project).where('projects.billable = ? ', billable) }
  scope :billable, -> { by_billability(true) }
  scope :non_billable, -> { by_billability(false) }

  scope :within, ->(range) { where(created_at: range) } do
    def total_duration
      map(&:duration).sum(Duration.zero)
    end

    def billable_amount
      TimeEntry.billable_amount(ids)
    end

    def most_recent
      order(created_at: :desc).first
    end
  end

  scope :today, -> { within(DateRange.today) }
  scope :this_week, -> { within(DateRange.this_week) }
  scope :last_week, -> { within(DateRange.last_week) }
  scope :this_semimonth, -> { within(DateRange.this_semimonth) }
  scope :this_month, -> { within(DateRange.this_month) }
  scope :this_quarter, -> { within(DateRange.this_quarter) }
  scope :this_year, -> { within(DateRange.this_year) }

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

  def billable_amount
    return 0 unless billable?

    pay_rate * round
  end

  def round
    duration.round(rounding_factor)
  end

  def date
    created_at.to_date
  end
end
