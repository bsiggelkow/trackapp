class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @project = projects.first
  end

  def show
    @project = projects.find(params[:id])
  end

  def create
    @project = Projects.create(name: params[:name])
    @projects = Project.all
  end

  def destroy
    @deleted = Project.find(params[:id]).destroy
    @project = projects.first
    render :show
  end 

  private

  def projects
    Project.includes(tasks: :logs)
  end

end
