class ProjectsController < ApplicationController

  def index
  	@projects = Project.latest.page params[:page]
  end

  def show
  	@project = Project.find(params[:id])
  	@pledge = Pledge.new
  end
  
end
