# frozen_string_literal: true

class TimeController < ApplicationController
  def index
    render :index, locals: { view: }
  end

  def day_duration
    render partial: 'day_duration', locals: { duration:, date: }
  end

  private

  def duration
    view.date_totals[date]
  end

  def view
    TimeView[view_key].new(current_user.project_ids, params)
  end

  def view_key
    params.fetch(:view, 'day')
  end

  def date
    Date.parse(params.fetch(:date, Date.today.to_s))
  end
end
