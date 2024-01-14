class Dashboard::Grid
  MAX_SIZE = 8

  def initialize(placements)
    @placements = placements
    @widget_positions = nil
    @widgets = nil
  end

  def next_position
    next_open_position(Position.origin)
  end

  def full?
    widget_positions.size == MAX_SIZE
  end

  def available?(position)
    !occupied?(position)
  end

  def occupied?(position)
    widget_positions.key?(position)
  end

  def widgets
    @widgets ||= @placements.sort_by(&:position).map!(&:widget)
  end

  private

  def widget_positions
    @widget_positions ||= widgets.reduce({}) { |h, w| h.merge!(w.position => w) }
  end

  def next_open_position(position)
    return if position.terminal?
    return position if available?(position)

    if position.right_most? && !position.bottom?
      next_open_position(position.down)
    else
      next_open_position(position.right)
    end
  end
end
