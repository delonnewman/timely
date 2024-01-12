# frozen_string_literal: true

class GroupsController < ApplicationController
  def new
    render partial: 'new', locals: { group: current_user.team.groups.build }
  end

  def create
    group = Group.new(group_params)

    if group.save
      render partial: 'show', locals: { group: }
    else
      render partial: 'new', locals: { group: }
    end
  end

  def edit
    render partial: 'edit', locals: { group: }
  end

  def update
    if group.update(group_params)
      render partial: 'show', locals: { group: }
    else
      render partial: 'edit', locals: { group: }
    end
  end

  def destroy
    group.destroy

    render inline: ''
  end

  private

  def group
    Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :team_id)
  end
end
