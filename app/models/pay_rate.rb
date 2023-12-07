# frozen_string_literal: true

# A pay rate that can be associated with a project
class PayRate < ApplicationRecord
  belongs_to :project, optional: true

  def *(other)
    case unit
    when 'per hour'
      magnitude * other.in_hours
    else
      magnitude * other.in_minutes
    end
  end
end
