# frozen_string_literal: true

module ProjectsHelper
  def new_project_id(group_name)
    "new-project-#{Kindly::Utils.slug(group_name)}"
  end
end
