# frozen_string_literal: true

class ReportsController < ApplicationController
  # TODO: move this default to user / account settings
  DEFAULT_KIND = :week

  def index
    render :index, locals: { report: report_view }
  end

  def detailed
    render :detailed, locals: { report: report_view }
  end

  private

  def report_view
    ReportView[kind_key].build(current_user, start_on:, end_on:, tab:)
  end

  def kind_key
    params.fetch(:kind, DEFAULT_KIND).to_sym
  end

  def start_on
    params[:start_on].presence
  end

  def end_on
    params[:end_on].presence
  end

  def tab
    params.fetch(:tab, 'groups')
  end
end
