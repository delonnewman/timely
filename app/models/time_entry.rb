# frozen_string_literal: true

# An entry of recorded minutes in a project
class TimeEntry < ApplicationRecord
  belongs_to :user

  belongs_to :project
  delegate :rounding_factor, :pay_rate, :billable?, to: :project
  has_one :group, through: :project

  validates :minutes, presence: true, numericality: true
  composed_of :duration, mapping: { minutes: :minutes }, converter: ->(duration) { Duration[duration] }

  def round
    duration.round(rounding_factor)
  end

  def billable_amount
    return 0 unless billable?

    pay_rate * duration.round(rounding_factor)
  end
end
