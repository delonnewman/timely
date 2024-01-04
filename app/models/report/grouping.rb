# frozen_string_literal: true

class Report::Grouping
  def self.build(name:, report:)
    grouping_class(name).new(report)
  end

  GROUPINGS = {
    'date' => ByDate,
    'group' => ByGroup,
    'person' => ByPerson,
    'project' => ByProject
  }.freeze
  private_constant :GROUPINGS

  def self.grouping_class(name)
    GROUPINGS.fetch(name, GROUPINGS[default_name])
  end

  def self.default_name
    'group'
  end

  def self.names
    GROUPINGS.keys
  end

  attr_reader :report

  def initialize(report)
    @report = report
  end

  def name
    self.class.name.split('::').last.sub('By', '').downcase
  end

  def columns
    raise NotImplementedError
  end

  def entries
    raise NotImplementedError
  end

  def column_names
    columns.values
  end

  def column_methods
    columns.keys
  end
end
