# frozen_string_literal: true

# The organizing unit for time entries
class Project < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :rounding_factor, presence: true, numericality: true

  belongs_to :group, optional: true
  has_many :time_entries

  has_one :pay_rate, dependent: :destroy
  accepts_nested_attributes_for :pay_rate

  def to_s
    return name unless group

    "#{group.name}: #{name}"
  end
end
