class PledgesController < ApplicationController
  
  before_filter :require_login 

	def create
  	@project = Project.find(params[:project_id])
  	@pledge = Pledge.new(
  		:amount => params[:pledge][:amount],
  		:user_id => current_user.id,
  		:project_id => params[:project_id])
  	
  	if @pledge.save 
  		redirect_to @project  
  		flash[:notice] = "Thanks for supporting this project!"
  	else
  		render 'projects/show' 
  		#flash[:notice] = "Uups...something went wrong. Try again!"
  	end
  end

end
