# frozen_string_literal: true

# A pay rate that can be associated with a project
class PayRate
  attr_reader :magnitude, :unit

  def self.unit(name)
    Project.pay_rate_units[name]
  end

  def self.per_hour(magnitude)
    new(magnitude, unit(:per_hour))
  end

  def initialize(magnitude, unit)
    @magnitude = magnitude
    @unit = unit
  end

  def *(other)
    case unit
    when 'per_hour'
      magnitude * other.in_hours
    else
      magnitude * other.in_minutes
    end
  end
end
