# frozen_string_literal: true

# An entry of recorded minutes in a project
class TimeEntry < ApplicationRecord
  belongs_to :project
  delegate :rounding_factor, to: :project

  validates :minutes, presence: true
  composed_of :duration, mapping: { minutes: :minutes }, converter: ->(duration) { Duration[duration] }

  def round
    duration.round(rounding_factor)
  end
end
