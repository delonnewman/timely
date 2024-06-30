# frozen_string_literal: true

class Duration::ExplicitFormat < Duration::Format
  matches %r/\A\d{1,2}h,?\s*\d\dm\z/

  def parse
    hours = []
    minutes = []
    read_hours = true
    read_minutes = false

    tokens.each do |token|
      next if token == ','

      hours << token if read_hours
      minutes << token if read_minutes

      if token == 'h'
        read_hours = false
        read_minutes = true
      end

      read_minutes = false if token == 'm'
    end

    h = hours.join('').to_i
    m = minutes.join('').to_i
    Duration.minutes((h.to_i * 60) + m.to_i)
  end

  def tokens
    string.split('')
  end
end
