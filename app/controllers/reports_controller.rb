# frozen_string_literal: true

class ReportsController < ApplicationController
  # TODO: move this default to user / account settings
  DEFAULT_KIND = :week

  def index
    render :index, locals: { report: }
  end

  def detailed
    render :detailed, locals: { report: }
  end

  private

  def report
    ReportView[kind_key].build(current_user.project_ids, start_on:, end_on:, grouping:)
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

  def grouping
    params.fetch(:grouping, Report::Grouping.default_name)
  end
end
