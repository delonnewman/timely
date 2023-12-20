# frozen_string_literal: true

# A duration of time in minutes
class Duration
  include Comparable

  attr_reader :minutes

  delegate :to_i, :to_r, :to_f, :hash, :zero?, to: :@minutes

  def self.zero
    @zero ||= new(0)
  end

  # Construct duration objects from hour, minute components or from a string.
  # When two arguments are given they will be treated as hour, minute components
  # and assumed to be integers. When one argument is given and it is a string it
  # will be parsed otherwise it will be passed to new as the number of minutes.
  #
  # @see parse for string formatting
  def self.[](hour, min = nil)
    if min
      new((hour * 60) + min)
    elsif hour.is_a?(String)
      parse(hour)
    else
      new(hour)
    end
  end

  ParseError = Class.new(RuntimeError)

  # Parse duration from string of the form "HH:MM"
  def self.parse(string)
    raise ParseError, "invalid format expected HH:MM, got #{string.inspect}" unless string =~ /\A\d{1,2}:\d\d\z/

    hour, min = string.split(':')
    new((hour.to_i * 60) + min.to_i)
  end

  def initialize(minutes)
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
    format '%<hour>d:%<min>02d', hour:, min:
  end
  alias inspect to_s

  def in_hours
    minutes.to_f / 60
  end

  # Add this for symmetry
  alias in_minutes minutes

  def hour
    in_hours.truncate
  end

  def min
    ((in_hours - hour) * 60).round
  end

  def round(factor = 15)
    Duration.new((minutes.to_r / factor).round * factor)
  end
end
