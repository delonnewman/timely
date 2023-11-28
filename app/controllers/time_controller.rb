# frozen_string_literal: true

class TimeController < ApplicationController
  def index
    view = TimeView[view_desc].new(Project.ids, params)

    render :index, locals: { view: }
  end

  private

  def view_desc
    params.fetch(:view, 'day')
  end
end
