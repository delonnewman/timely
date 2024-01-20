# frozen_string_literal: true

module Widgets
  # Display current field service report
  class FieldMinistry < Widget
    size :small
    attribute :credit_project_names, default: [].freeze
    attribute :goal_hours, default: 15

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

    private

    def this_month_project_hours(project_names)
      TimeEntry
        .for_projects(user.projects.named(project_names))
        .this_month
        .total_duration
    end
  end
end
