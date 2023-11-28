# frozen_string_literal: true

class ProjectsController < ApplicationController
  helper_method :project, :projects

  def index
    render :index
  end

  def show
    render partial: 'show'
  end

  def create
  end

  def edit
    render partial: 'edit'
  end

  def update
  end

  private

  def project
    Project.find(params[:id])
  end

  def projects
    Project.all
  end
end
