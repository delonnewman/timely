module Widgets
  class Today < Widget
    def date
      Date.today
    end

    def time
      Time.zone.now
    end

    def most_recent_entry
      @most_recent_entry ||= user.time_entries.this_week.most_recent
    end
  end
end
