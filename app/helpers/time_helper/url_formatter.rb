module TimeHelper
  class UrlFormatter
    def call(notes)
      collect_urls(notes).reduce(notes.dup) do |str, url|
        str.gsub(url, %(<a href="#{url}">#{url}</a>))
      end
    end

    private

    NAMES = %w[scheme opaque userinfo host port registry path opaque query fragment].freeze

    def collect_urls(notes)
      notes.scan(URI::DEFAULT_PARSER.make_regexp).map do |parts|
        construct_url(NAMES.zip(parts).to_h)
      end
    end

    def construct_url(parts)
      args = parts.values_at(
        'scheme', 'userinfo', 'host', 'port', 'registry', 'path', 'opaque', 'query', 'fragment'
      )
      URI::Generic.new(*args).to_s
    end
  end
end
