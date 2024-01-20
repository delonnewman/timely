module Widgets
  # Display up-to-date income information
  class Income < Widget
    size :small
    attribute :month_goal, default: 0

    def this_month
      user.time_entries.this_month.billable_amount
    end

    def this_week
      user.time_entries.this_week.billable_amount
    end

    def last_week
      user.time_entries.last_week.billable_amount
    end

    def still_to_go
      month_goal - this_month
    end

    def month_goal?
      !month_goal.zero?
    end
  end
end
