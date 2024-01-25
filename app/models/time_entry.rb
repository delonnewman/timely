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
      TimeEntryCalculation.billable_amount(ids)
    end

    def by_most_recent
      order(updated_at: :desc)
    end
  end

  scope :today, -> { within(DateRange.today) }
  scope :this_week, -> { within(DateRange.this_week) }
  scope :last_week, -> { within(DateRange.last_week) }
  scope :this_semimonth, -> { within(DateRange.this_semimonth) }
  scope :this_month, -> { within(DateRange.this_month) }
  scope :this_quarter, -> { within(DateRange.this_quarter) }
  scope :this_year, -> { within(DateRange.this_year) }

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
