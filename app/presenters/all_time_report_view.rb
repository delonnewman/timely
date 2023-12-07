# frozen_string_literal: true

# Report on all the user's entries
class AllTimeReportView < ReportView
  def self.current(user)
    new(user, start_on: user.earliest_entry_created_at, end_on: Date.today)
  end

  def kind
    'all_time'
  end

  def title
    'All Time'
  end
end
