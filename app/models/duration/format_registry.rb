# frozen_string_literal: true

class Duration::FormatRegistry
  def initialize
    @formats = []
  end

  def <<(format)
    formats << format
  end

  def find(string)
    select(string) or raise "unknown format: #{string.inspect}"
  end

  def select(string)
    format = formats.find { |fmt| fmt.match?(string) }
    return unless format

    format.new(string)
  end

  private

  attr_reader :formats
end
