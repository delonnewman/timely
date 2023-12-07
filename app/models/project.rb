# frozen_string_literal: true

# TODO: Add #billable

# The organizing unit for time entries
class Project < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :rounding_factor, presence: true, numericality: true

  belongs_to :group, optional: true
  has_many :time_entries

  has_one :pay_rate, dependent: :destroy
  accepts_nested_attributes_for :pay_rate

  def to_s
    name
  end

  def total_duration
    time_entries.select(:minutes, :project_id).map(&:duration).reduce(:+)
  end

  def gross_income
    return 0 unless billable?

    pay_rate * total_duration
  end
end
