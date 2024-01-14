module Widgets
  class Income < Widget
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

    def month_goal
      meta_data.fetch('income.month_goal', 0)
    end
  end
end
