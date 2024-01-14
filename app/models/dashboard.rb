class Dashboard < ApplicationRecord
  belongs_to :user

  delegate :full?, to: :grid

  has_many :widget_placements do
    def add(widget_class, position, **meta_data)
      create(widget_class_name: widget_class.name, position:, meta_data:)
    end
  end

  def add_widget(widget_class, **meta_data)
    namespaced = MetaData.namespace_keys(meta_data, widget_class)
    widget_placements.add(widget_class, grid.next_position, **namespaced)
  end

  def swap_widgets(widget1, widget2)
    widget1.swap_with!(widget2)
  end

  def grid
    @grid ||= Grid.new(widget_placements)
  end
end
