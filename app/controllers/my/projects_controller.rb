class My::ProjectsController < ApplicationController

  before_filter :require_login

  def index
    @projects = current_user.projects.latest.page params[:page]
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build params[:project]
    if @project.save
      redirect_to @project, :notice => "Project successfully created."
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end
    
  def update    
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice => 'Project was successfully updated.'
    else
      render :action => "edit" 
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to my_projects_path, :notice => 'Project was successfully deleted.'
  end
end
