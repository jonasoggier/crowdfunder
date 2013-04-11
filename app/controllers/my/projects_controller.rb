class My::ProjectsController < ApplicationController

  before_filter :require_login

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build params[:project]
    if @project.save
      redirect_to @project, notice: "Project successfully created."
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
  end
end
