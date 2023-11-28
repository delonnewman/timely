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
end
