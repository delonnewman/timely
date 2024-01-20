class DashboardsController < ApplicationController
  def index
    dashboard = DashboardPresenter.new(current_user.find_or_create_dashboard)

    render :index, locals: { dashboard: }
  end

  def show
    dashboard = DashboardPresenter.new(current_user.dashboard)

    render partial: 'show', locals: { dashboard: }
  end

  def edit
    dashboard = DashboardPresenter.new(current_user.dashboard)

    render partial: 'edit', locals: { dashboard: }
  end
end
