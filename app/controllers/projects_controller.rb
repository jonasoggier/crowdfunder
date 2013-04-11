class ProjectsController < ApplicationController

	before_filter :require_login, :except => [:index, :show]
  
  def index
  	@projects = Project.all
  end

  def show
  	@project = Project.find(params[:id])
  	@pledge = Pledge.new
  end

  def new
  	
  end

	def create
  	
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


end
