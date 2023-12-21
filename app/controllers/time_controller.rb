# frozen_string_literal: true

class TimeController < ApplicationController
  def index
    render :index, locals: { view: }
  end

  def day_duration
    duration = view.date_totals[date]

    render partial: 'day_duration', locals: { duration:, date: }
  end

  def week_duration
    duration = view.week_total_duration

    render partial: 'week_duration', locals: { duration:, date: }
  end

  private

  def view
    TimeView[view_key].new(current_user, params)
  end

  def view_key
    params.fetch(:view, 'day')
  end

  def date
    Date.parse(params.fetch(:date, Date.today.to_s))
  end
end
