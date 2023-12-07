# frozen_string_literal: true

module Timely
  # A collection of utility functions for use within the application
  module Utils
    module_function

    # Generate a slug from string with all non safe and space characters replaced by the delimiter
    # @api public
    #
    # @example
    #   Timely::Utils.slug("$%`Hey`there") # => "hey-there"
    #
    # @param [String] string
    # @param [String] delimiter
    #
    # @return [String]
    def slug(string, delimiter: '-')
      string = string.is_a?(Symbol) ? string.name : string.to_s
      string = string.gsub(/\W+\z/, '')
      string.gsub!(/\A\W+/, '')
      string.gsub!(/\W+/, delimiter)
      string.downcase!

      string
    end
  end
end
