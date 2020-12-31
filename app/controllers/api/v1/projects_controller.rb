class Api::V1::ProjectsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    projects = user.projects
    render json: projects, status: :ok
  end

  def show
    project = Project.find(params[:id])
    render json: project, status: :ok
  end

  def create
    user = User.find(params[:user_id])
    project = Project.new(project_params)
    user.projects.push(project)
    render json: project
  end

  private
  def project_params
    params.require(:project).permit(:title, :notes)
  end
end
