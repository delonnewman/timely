# frozen_string_literal: true

# Tools for working with meta data
module MetaData
  def self.namespace_keys(meta_data, klass)
    prefix = namespace(klass)
    meta_data.transform_keys do |name|
      "#{prefix}.#{name}"
    end
  end

  def self.get(meta_data, name, alt = nil)
    denamespace_keys(meta_data).fetch(name, alt)
  end

  def self.denamespace_keys(meta_data)
    meta_data.transform_keys do |name|
      name.split('.').last
    end
  end

  def self.namespace(klass)
    klass.name.split('::').last.underscore
  end
end
