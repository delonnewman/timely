# frozen_string_literal: true

module NavHelper
  def nav_item(label, path, active: false)
    %(<li class="nav-item">#{NavLink.new(label:, path:, active:)}</li>).html_safe
  end
end
