# frozen_string_literal: true

# The position of a widget on a dashboard
#
# For now dashboards consist of a grid of widgets
# four widgets wide and 2 widgets tall. Eventually
# support for different sized widgets may be added.
class Position
  include Comparable

  TOP        = 0
  BOTTOM     = 1
  LEFT_MOST  = 0
  RIGHT_MOST = 3

  attr_reader :horizontal, :vertical
  alias x horizontal
  alias y vertical

  delegate :origin, to: 'self.class'

  def self.[](...)
    new(...)
  end

  def self.origin
    @origin ||= new(0, 0)
  end

  def self.terminal
    @terminal ||= new(RIGHT_MOST, BOTTOM)
  end

  def self.within_horizontal_range(value)
    return LEFT_MOST  if value < LEFT_MOST
    return RIGHT_MOST if value > RIGHT_MOST

    value
  end

  def self.within_vertical_range(value)
    return TOP    if value < TOP
    return BOTTOM if value > BOTTOM

    value
  end

  def initialize(horizontal, vertical)
    @horizontal = Position.within_horizontal_range(horizontal)
    @vertical   = Position.within_vertical_range(vertical)
    freeze
  end

  def to_s
    "#{self.class}[#@horizontal, #@vertical]"
  end
  alias inspect to_s

  def to_a
    [@horizontal, @vertical]
  end

  def eql?(other)
    return false unless other.is_a?(Position)

    hash == other.hash
  end

  def hash
    to_a.hash
  end

  def origin?
    @vertical.zero? && @horizontal.zero?
  end

  def terminal?
    @vertical == BOTTOM && @horizontal == RIGHT_MOST
  end

  MOVEMENTS = %i[
    up down left right top bottom left_most right_most origin terminal
  ].to_set.freeze

  def move!(movement)
    position = move(movement)
    raise "invalid movement: #{movement}" if self == position

    position
  end
  alias move_to! move!

  def move(movement)
    return self unless MOVEMENTS.include?(movement)

    public_send(movement)
  end
  alias move_to move

  def can_move?(movement)
    move(movement) != self
  end
  alias can_move_to? can_move?

  def <=>(other)
    cmp = @vertical <=> other.vertical
    return cmp * -1 unless cmp.zero? # reverse the sign since origin is 0,0

    @horizontal <=> other.horizontal
  end

  def ==(other)
    return false unless other.is_a?(Position)

    @horizontal == other.horizontal && @vertical == other.vertical
  end

  def left
    return left_most if left_most?

    self.class.new(@horizontal - 1, @vertical)
  end

  def right
    return right_most if right_most?

    self.class.new(@horizontal + 1, @vertical)
  end

  def left_most?
    @horizontal == LEFT_MOST
  end

  def right_most?
    @horizontal == RIGHT_MOST
  end

  def left_most
    self.class.new(LEFT_MOST, @vertical)
  end

  def right_most
    self.class.new(RIGHT_MOST, @vertical)
  end

  def up
    return top if top?

    self.class.new(@horizontal, @vertical - 1)
  end

  def down
    return bottom if bottom?

    self.class.new(@horizontal, @vertical + 1)
  end

  def top?
    @vertical == TOP
  end

  def bottom?
    @vertical == BOTTOM
  end

  def top
    self.class.new(@horizontal, TOP)
  end

  def bottom
    self.class.new(@horizontal, BOTTOM)
  end
end
