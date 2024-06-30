# frozen_string_literal: true

# A duration of time in minutes
class Duration < Numeric
  include Comparable

  attr_reader :minutes

  delegate :to_i, :to_r, :to_f, :hash, :zero?, :coerce, to: :@minutes

  def self.zero
    @zero ||= new(0)
  end

  def self.minutes(minutes)
    new(minutes)
  end

  def self.hours(hours)
    new(hours * 60)
  end

  # Construct duration objects from hour, minute components or from a string.
  # When two arguments are given they will be treated as hour, minute components
  # and assumed to be integers. When one argument is given and it is a string it
  # will be parsed otherwise it will be passed to new as the number of minutes.
  #
  # @see parse for string formatting
  def self.[](first, second = nil)
    if second
      new((first * 60) + second)
    elsif first.is_a?(String)
      parse(first)
    else
      new(first.to_i)
    end
  end

  def self.parse(string)
    Duration::Format.registry.find(string).parse
  end

  Duration::Format.registry << Duration::ColonFormat
  Duration::Format.registry << Duration::ExplicitFormat

  private_class_method :new

  def initialize(minutes)
    super()
    @minutes = minutes
    freeze
  end

  def <=>(other)
    mins = other.respond_to?(:minutes) ? other.minutes : other

    return -1 if minutes < mins
    return  1 if minutes > mins

    0
  end

  def +(other)
    if other.respond_to?(:minutes)
      Duration.minutes(minutes + other.minutes)
    else
      Duration.minutes(minutes + other)
    end
  end

  def -@
    Duration.minutes(-minutes)
  end

  def -(other)
    self + -other
  end

  def eql?(other)
    other.is_a?(Duration) && other.minutes.eql?(minutes)
  end

  def to_s
    format '%<hour>d:%<min>02d', hour:, min:
  end
  alias inspect to_s

  def in_hours
    minutes.to_f / 60
  end

  # Add this for symmetry
  alias in_minutes minutes

  def in_seconds
    minutes * 60
  end

  def hour
    in_hours.truncate
  end

  def min
    ((in_hours - hour) * 60).round
  end

  def round(factor = 15)
    Duration.minutes((minutes.to_r / factor).round * factor)
  end

  def from_now
    Time.zone.now + in_seconds
  end

  def ago
    Time.zone.now - in_seconds
  end
end
