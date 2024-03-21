# frozen_string_literal: true

class TimeController < ApplicationController
  def index
    render :index, locals: { view: }
  end

  def day_duration
    duration = view.date_totals.fetch(date, Duration.zero)

    render partial: 'day_duration', locals: { duration:, date: }
  end

  def week_duration
    duration = view.week_total_duration

    render partial: 'week_duration', locals: { duration:, date: }
  end

  private

  def view
    TimeView[view_key].new(current_user, date)
  end

  def view_key
    params.fetch(:view, 'day')
  end

  def date
    return Date.parse(params[:date]) if params.key?(:date)

    date_from_components
  end

  def date_from_components
    today = Date.today
    year  = params.fetch(:year, today.year).to_i
    month = params.fetch(:month, today.month).to_i
    day   = params.fetch(:day, today.day).to_i

    Date.new(year, month, day)
  end
end
