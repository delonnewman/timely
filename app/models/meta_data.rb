# frozen_string_literal: true

# Tools for working with meta data
module MetaData
  def self.namespace_keys(meta_data, klass)
    prefix = namespace(klass)
    meta_data.transform_keys do |name|
      "#{prefix}.#{name}"
    end
  end

  def self.namespace(klass)
    klass.name.split('::').last.underscore
  end
end
