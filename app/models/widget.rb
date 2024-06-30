# frozen_string_literal: true

# A base class for widgets
class Widget
  attr_reader :placement

  delegate :meta_data, :position, :dashboard, :user, to: :@placement

  def self.size(value = nil)
    return @size if value.nil?

    @size = WidgetSize.cast(value)
  end

  def self.attribute(name, **options)
    attr_reader name

    @attributes ||= {}
    @attributes[name] = options.merge!(name:)

    name
  end

  def self.attributes
    @attributes || EMPTY_HASH
  end

  def initialize(placement)
    @placement = placement
    self.class.attributes.each_value do |attribute|
      name  = attribute[:name].name
      value = MetaData.get(meta_data, name, attribute[:default])
      instance_variable_set(:"@#{name}", value)
    end
  end

  def to_partial_path
    self.class.name.underscore
  end

  def swap_with!(other)
    @placement.swap_with!(other.placement)
  end

  EMPTY_HASH = {}.freeze
  private_constant :EMPTY_HASH
end
