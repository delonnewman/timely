# A placement of a widget on a dashboard
class WidgetPlacement < ApplicationRecord
  belongs_to :dashboard
  has_one :user, through: :dashboard

  composed_of :position, mapping: { position_horizontal: :horizontal, position_vertical: :vertical }

  def widget
    @widget ||= widget_class.new(self)
  end

  def widget_class
    widget_class_name.constantize
  end

  def swap_with!(other)
    self_position = position
    other_position = other.position
    ActiveRecord::Base.transaction do
      update!(position: other_position)
      other.update!(position: self_position)
    end
  end
end
