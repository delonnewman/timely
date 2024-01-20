module DashboardHelper
  def entry_summary(entry)
    return unless entry

    %(
      <div>
        #{entry.project}&mdash;#{entry.duration}<br>
        <small class="text-muted">#{truncate(entry.description, length: 68)}</small>
      </div>
    ).html_safe
  end
end
