module DashboardHelper
  def entry_summary(entry)
    return unless entry

    %(#{entry.project}&mdash;#{entry.duration}<br>
      <small class="text-muted">#{entry.description}</small>).html_safe
  end
end
