# frozen_string_literal: true

module ReportsHelper
  def next_report_path(report)
    return reports_path unless report.symmetric?

    reports_path(kind: report.kind, start_on: report.next.start_on, end_on: report.next.end_on, grouping: report.grouping.name)
  end

  def prev_report_path(report)
    return reports_path unless report.symmetric?

    reports_path(kind: report.kind, start_on: report.prev.start_on, end_on: report.prev.end_on, grouping: report.grouping.name)
  end

  def current_report_path(report)
    reports_path(kind: report.kind)
  end

  def report_nav_classes(report)
    classes = %w[btn btn-sm btn-outline-secondary]
    classes << 'disabled' unless report.symmetric?
    classes.join(' ')
  end

  def current_report_label(report)
    "Return to this #{report.kind}"
  end

  KINDS = {
    'week' => 'Week',
    'semimonth' => 'Semimonth',
    'month' => 'Month',
    'quarter' => 'Quarter',
    'year' => 'Year',
    'all_time' => 'All Time',
    'custom' => 'Custom'
  }.freeze

  def options_for_report_kinds(selected = nil)
    options_for_select(KINDS.map(&:reverse), selected)
  end

  def report_tab_path(report, grouping:)
    reports_path(grouping:, start_on: report.start_on, end_on: report.end_on, kind: report.kind)
  end

  def options_for_report_groupings(selected = nil)
    options_for_select(Report::Grouping.names.map { |name| [name.titlecase, name] }, selected)
  end
end
