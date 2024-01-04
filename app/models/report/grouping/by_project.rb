class Report::Grouping::ByProject < Report::Grouping
  def columns
    {
      date: 'Date',
      group: 'Group',
      user: 'Person',
      duration: 'Hours'
    }
  end

  def entries
    report
      .entries
      .includes(:user, project: :group)
      .order('groups.name, projects.name')
      .group_by(&:project)
  end
end
