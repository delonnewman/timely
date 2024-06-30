# frozen_string_literal: true

class Duration::ColonFormat < Duration::Format
  matches %r/\A\d{1,2}:\d\d\z/

  def parse
    hour, min = string.split(':')
    Duration.minutes((hour.to_i * 60) + min.to_i)
  end
end
