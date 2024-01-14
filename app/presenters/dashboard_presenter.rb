class DashboardPresenter < SimpleDelegator
  def widgets_by_row(index)
    widgets.select do |widget|
      widget.position.vertical == index
    end
  end

  def widgets
    grid.widgets
  end
end
