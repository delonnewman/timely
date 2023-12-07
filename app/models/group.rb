# frozen_string_literal: true

# A grouping of activities, for example a client name or some other description
class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 15 }

  belongs_to :team

  has_many :projects
  accepts_nested_attributes_for :projects

  has_many :time_entries, through: :projects

  def to_s
    name
  end
end
