# frozen_string_literal: true

# A grouping of activities, for example a client name or some other description
class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 15 }

  has_many :projects
end
