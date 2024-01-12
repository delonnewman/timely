module TimeHelper
  class NoteString
    def initialize(notes)
      @notes = notes
    end

    def format(*formatters)
      formatters.reduce(+'') do |str, formatter|
        str + formatter.call(@notes)
      end
    end
  end
end
