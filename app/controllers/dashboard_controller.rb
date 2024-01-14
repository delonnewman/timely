class DashboardController < ApplicationController
  def index
    dashboard = DashboardPresenter.new(current_user.dashboard)

    render :index, locals: { dashboard: }
  end
end
