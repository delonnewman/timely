class Duration::Format
  def self.matches(regex)
    @pattern = regex
  end

  def self.pattern
    @pattern
  end

  def self.registry
    @registry ||= Duration::FormatRegistry.new
  end

  def self.match?(string)
    string.match?(pattern)
  end

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def parse
    raise NoMethodError
  end
end
