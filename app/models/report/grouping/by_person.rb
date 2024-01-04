class Report::Grouping::ByPerson < Report::Grouping
  def columns
    {
      date: 'Date',
      project: 'Project',
      user: 'Person',
      duration: 'Hours'
    }
  end

  def entries
    report
      .entries
      .includes(:user, project: :group)
      .order('users.name, groups.name, projects.name')
      .group_by(&:user)
  end
end
