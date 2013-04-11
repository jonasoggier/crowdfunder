class ProjectsController < ApplicationController

  def index
  	@projects = Project.all
  end

  def show
  	@project = Project.find(params[:id])
  	@pledge = Pledge.new
  end
  
end
