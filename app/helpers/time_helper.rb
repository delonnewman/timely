# frozen_string_literal: true

module TimeHelper
  def time_url(...)
    time_path(...)
  end

  def time_path(date = nil, view: 'day')
    path = ['/time']

    if date
      path << view.downcase
      path << date.year
      path << date.month
      path << date.day
    end

    path.join('/')
  end

  def formatted_time(view)
    view.start_at.strftime('%A, %B %e')
  end

  def format_notes(entry)
    NoteString.new(entry.description || '').format(UrlFormatter.new).html_safe
  end
end
