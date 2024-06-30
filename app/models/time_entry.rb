# frozen_string_literal: true

# An entry of recorded minutes in a project
class TimeEntry < ApplicationRecord
  belongs_to :user

  belongs_to :project
  delegate :rounding_factor, :pay_rate, :billable?, to: :project
  has_one :group, through: :project

  validates :minutes, presence: true, numericality: { only_integer: true, greater_than: 0 }
  composed_of :duration, mapping: { minutes: :minutes }, converter: ->(minutes) { Duration[minutes] }

  enum :status, %i[timed being_timed]
  after_initialize :set_status

  validates :started_at, presence: true
  before_validation :ensure_start_at

  scope :being_timed, -> { where(status: :being_timed) }
  scope :timed, -> { where(status: :timed) }

  scope :for_projects, ->(projects) { includes(:project).where(project: projects) }
  scope :by_billability, ->(billable) { joins(:project).where('projects.billable = ? ', billable) }
  scope :billable, -> { by_billability(true) }
  scope :non_billable, -> { by_billability(false) }

  scope :today, -> { within TimeRange.today }
  scope :this_week, -> { within TimeRange.this_week }
  scope :last_week, -> { within TimeRange.last_week }
  scope :this_semimonth, -> { within TimeRange.this_semimonth }
  scope :this_month, -> { within TimeRange.this_month }
  scope :this_quarter, -> { within TimeRange.this_quarter }
  scope :this_year, -> { within TimeRange.this_year }

  scope :within, ->(range) { where(started_at: range) } do
    def total_duration
      map(&:duration).sum(Duration.zero)
    end

    def billable_amount
      TimeEntryCalculation.billable_amount(ids)
    end

    def by_most_recent
      order(started_at: :desc)
    end
  end

  def billable_amount
    return 0 unless billable?

    pay_rate * round
  end

  def round
    duration.round(rounding_factor)
  end

  def date
    started_at.to_date
  end

  private

  def ensure_start_at
    self.started_at = Time.zone.now unless started_at
  end

  def set_status
    self.status = :being_timed unless minutes
  end
end
