# frozen_string_literal: true

module ProjectsHelper
  def new_project_id(group)
    "new-project-#{Kindly::Utils.slug(group.name)}"
  end

  def group_card_width
    360
  end
end
