# frozen_string_literal: true

class TimeEntriesController < ApplicationController
  def new
    entry = TimeEntry.new

    render partial: 'new', locals: { time_entry: entry, entry_date: }
  end

  def create
    entry = TimeEntry.new(time_entry_params)

    if entry.save
      render partial: 'show', locals: { time_entry: entry, entry_date: }
    else
      render partial: 'new', locals: { time_entry: entry, entry_date: }
    end
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

    if no_entries?
      render partial: 'time_entries/empty'
    else
      render inline: ''
    end
  end

  private

  def time_entry
    TimeEntry.find(params[:id])
  end

  def no_entries?
    TimeEntry
      .where('created_at between ? and ?', entry_date.at_beginning_of_day, entry_date.at_end_of_day)
      .empty?
  end

  def entry_date
    Date.parse(params[:entry_date] || Date.today.to_s)
  end

  def time_entry_params
    params.require(:time_entry).permit(:duration, :description, :project_id, :created_at, :user_id)
  end
end
