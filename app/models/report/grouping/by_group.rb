class Report::Grouping::ByGroup < Report::Grouping
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
      .order('groups.name, projects.name')
      .group_by(&:group)
  end
end
