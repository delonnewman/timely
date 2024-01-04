class Report::Grouping::ByDate < Report::Grouping
  def columns
    {
      group: 'Group',
      project: 'Project',
      user: 'Person',
      duration: 'Hours'
    }
  end

  def entries
    report
      .entries
      .includes(:user, project: :group)
      .order(:created_at, 'groups.name, projects.name')
      .group_by(&:date)
  end
end
