# frozen_string_literal: true

module Widgets
  # Display current field service report
  class FieldMinistry < Widget
    def gap_hours
      goal_hours - total_hours.in_hours
    end

    def total_hours
      field_ministry_hours + credit_hours
    end

    def field_ministry_hours
      this_month_project_hours('Field Ministry')
    end

    def credit_hours
      this_month_project_hours(credit_project_names)
    end

    def credit_project_names
      meta_data.fetch('field_ministry.credit_project_names', [])
    end

    def goal_hours
      meta_data.fetch('field_ministry.goal_hours', 15)
    end

    private

    def this_month_project_hours(project_names)
      TimeEntry
        .for_projects(user.projects.named(project_names))
        .this_month
        .total_duration
    end
  end
end
