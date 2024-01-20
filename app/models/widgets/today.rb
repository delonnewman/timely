module Widgets
  # Display an overview of today's activity
  class Today < Widget
    size :small

    def date
      Date.today
    end

    def time
      Time.zone.now
    end

    def most_recent_entry
      user.time_entries.today.by_most_recent.first
    end
  end
end
