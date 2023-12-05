# frozen_string_literal: true

class TimeEntriesController < ApplicationController
  def new
    render partial: 'new', locals: { entry_date: }
  end

  def create
    entry = TimeEntry.create(time_entry_params)

    render partial: 'show', locals: { time_entry: entry, entry_date: }
  end

  def show
    render partial: 'show', locals: { time_entry:, entry_date: }
  end

  def edit
    render partial: 'edit', locals: { time_entry:, entry_date: }
  end

  def update
    time_entry.update(time_entry_params)

    render partial: 'show', locals: { time_entry:, entry_date: }
  end

  def destroy
    time_entry.destroy

    render inline: '' # TODO: render empty if there are not more entries on this date
  end

  private

  def time_entry
    TimeEntry.find(params[:id])
  end

  def entry_date
    params[:entry_date] || Date.today.to_s
  end

  def time_entry_params
    params.require(:time_entry).permit(:duration, :description, :project_id, :created_at)
  end
end
