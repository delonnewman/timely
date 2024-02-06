module DashboardHelper
  def entry_summary(entry)
    return unless entry

    %(
      <div>
        <a href="#{time_path(entry.date)}" class="text-body">
          #{entry.project.name_with_group}&mdash;#{entry.duration}
        </a>
        <br><small class="text-muted">#{truncate(entry.description, length: 68)}</small>
      </div>
    ).html_safe
  end
end
