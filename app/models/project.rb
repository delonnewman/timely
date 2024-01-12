# frozen_string_literal: true

# The organizing unit for time entries
class Project < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: { scope: :group_id }
  validates :rounding_factor, presence: true, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :group
  has_many :time_entries

  has_one :pay_rate, dependent: :destroy
  accepts_nested_attributes_for :pay_rate

  has_many :timers
  has_many :invoices

  scope :grouped, -> { includes(:group).group_by(&:group) }

  def to_s(spec = :name)
    case spec
    when :with_group
      name_with_group
    else
      name
    end
  end

  def name_with_group
    "#{group.name}: #{name}"
  end

  def total_duration
    time_entries.select(:minutes, :project_id).map(&:duration).sum(Duration.zero)
  end

  def gross_income
    return 0 unless billable?

    pay_rate * total_duration
  end
end
