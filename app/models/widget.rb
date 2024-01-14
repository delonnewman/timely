class Widget
  attr_reader :placement

  delegate :meta_data, :position, :dashboard, :user, to: :@placement

  def initialize(placement)
    @placement = placement
  end

  def to_partial_path
    self.class.name.underscore
  end

  def swap_with!(other)
    @placement.swap_with!(other.placement)
  end
end
