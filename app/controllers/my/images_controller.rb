class My::ImagesController < ApplicationController

	before_filter :get_project
	before_filter :require_login

	def index
		@images = @project.images.order(:id)
		@image = @project.images.build
	end

	def create
		@image = @project.images.build(params[:image])
		if @image.save
			redirect_to [:my, @project, :images] # my_project_images_path(@project)
		else
			@images = @project.images.order(:id)
			render :index
		end
	end

	protected

	def get_project
		@project = Project.find(params[:project_id])
	end

end
