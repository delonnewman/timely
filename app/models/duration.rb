# frozen_string_literal: true

# A duration of time in minutes
class Duration
  attr_reader :minutes

  delegate :to_i, :to_r, :to_f, :hash, :zero?, to: :@minutes

  def self.zero
    @zero ||= new(0)
  end

  def initialize(minutes)
    @minutes = minutes
    freeze
  end

  def +(other)
    if other.is_a?(Duration)
      Duration.new(minutes + other.minutes)
    else
      Duration.new(minutes + other)
    end
  end

  def -@
    Duration.new(-minutes)
  end

  def -(other)
    self + -other
  end

  def eql?(other)
    other.is_a?(Duration) && other.minutes.eql?(minutes)
  end

  def to_s
    format '%<hour>02d:%<min>02d', hour:, min:
  end
  alias inspect to_s

  def in_hours
    minutes.to_f / 60
  end

  def hour
    in_hours.truncate
  end

  def min
    ((in_hours - hour) * 60).round
  end

  def round(factor)
    Duration.new((minutes.to_r / factor).round * factor)
  end
end
