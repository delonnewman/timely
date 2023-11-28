# frozen_string_literal: true

# An entry of recorded minutes in a project
class TimeEntry < ApplicationRecord
  validates :minutes, presence: true

  belongs_to :project
  delegate :rounding_factor, to: :project

  def duration(rounded: true)
    return Duration.new(minutes) unless rounded

    Duration.new(minutes).round(rounding_factor)
  end
end
