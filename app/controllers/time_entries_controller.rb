# frozen_string_literal: true

class TimeEntriesController < ApplicationController
  def new
    render partial: 'new', locals: { time_entry: TimeEntry.new, entry_time: }
  end

  def create
    entry = TimeEntry.new(time_entry_params)

    if entry.save
      day_duration_changed!
      render partial: 'show', locals: { time_entry: entry, entry_time: }
    else
      render partial: 'new', locals: { time_entry: entry, entry_time: }
    end
  end

  def show
    render partial: 'show', locals: { time_entry:, entry_time: }
  end

  def edit
    render partial: 'edit', locals: { time_entry:, entry_time: }
  end

  def update
    if time_entry.update(time_entry_params)
      day_duration_changed!
      render partial: 'show', locals: { time_entry:, entry_time: }
    else
      render partial: 'edit', locals: { time_entry:, entry_time: }
    end
  end

  def destroy
    time_entry.destroy
    day_duration_changed!

    if no_entries?
      render partial: 'time_entries/empty'
    else
      render inline: ''
    end
  end

  private

  def day_duration_changed!
    headers['HX-Trigger'] = 'timely:day-duration-changed'
  end

  def time_entry
    TimeEntry.find(params[:id])
  end

  def no_entries?
    TimeEntry
      .where('created_at between ? and ?', entry_time.at_beginning_of_day, entry_time.at_end_of_day)
      .empty?
  end

  def entry_time
    Date.parse(params[:entry_date] || Date.today.to_s).with_time(Time.now)
  end

  def time_entry_params
    params.require(:time_entry).permit(:duration, :description, :project_id, :created_at, :user_id)
  end
end
