class ReportGroupingEntryView
  delegate :date, :user, to: :@entry

  def initialize(entry)
    @entry = entry
  end

  def group
    @entry.group.name
  end

  def project
    if @entry.description
      %(#{@entry.project.name}<br><small class="text-muted">#{@entry.description}</small>).html_safe
    else
      @entry.project.name
    end
  end

  def duration
    %(<div class="text-end">#{@entry.duration}</div>).html_safe
  end
end
