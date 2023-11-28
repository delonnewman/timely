# frozen_string_literal: true

module NavHelper
  # A Boostrap 5 nav-link
  class NavLink
    attr_reader :active, :label, :path
    alias active? active

    def initialize(label:, path:, active: false)
      @label  = label
      @path   = path
      @active = active
    end

    def to_s
      classes = %w[nav-link]
      classes << 'active' if active?

      html = +%(<a href="#{path}" class="#{classes.join(' ')}")
      html << ' aria-current="page"' if active?
      html << '>' << label.to_s << '</a>'

      html.html_safe
    end
  end
end
