# frozen_string_literal: true

module ProjectsHelper
  def project_name(project)
    return project.name unless project.group

    "#{project.group}: #{project.name}"
  end
end
