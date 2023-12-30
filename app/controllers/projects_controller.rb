# frozen_string_literal: true

class ProjectsController < ApplicationController
  def new
    group = Group.find_by!(name: params[:group_name])

    render partial: 'new', locals: { project: group.projects.build }
  end

  def index
    render :index, locals: { projects: }
  end

  def show
    render partial: 'show', locals: { project: }
  end

  def create
    project = Project.new(project_params)

    if project.save
      render partial: 'show', locals: { project: }
    else
      render partial: 'new', locals: { project: }
    end
  end

  def edit
    render partial: 'edit', locals: { project: }
  end

  def update
    if project.update(project_params)
      render partial: 'show', locals: { project: }
    else
      render partial: 'edit', locals: { project: }
    end
  end

  def destroy
    project.destroy

    render inline: ''
  end

  private

  def project
    Project.find(params[:id])
  end

  def projects
    current_user.projects.grouped
  end

  def project_params
    params.require(:project).permit(:name, :group_id)
  end
end
