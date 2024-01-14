# frozen_string_literal: true

module NavHelper
  def nav_item(label = nil, path = nil, active: false, &block)
    if path.nil?
      path = label
      label = block.call
    end
    %(<li class="nav-item">#{NavLink.new(label:, path:, active:)}</li>).html_safe
  end
end
