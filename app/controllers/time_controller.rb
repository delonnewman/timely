# frozen_string_literal: true

class TimeController < ApplicationController
  def index
    view = TimeView[view_key].new(Project.ids, params)

    render :index, locals: { view: }
  end

  private

  def view_key
    params.fetch(:view, 'day')
  end
end
