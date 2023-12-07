# frozen_string_literal: true

# A group of users with shared reports
class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 255 }

  has_many :users
  has_many :groups
  has_many :projects, through: :groups
end
