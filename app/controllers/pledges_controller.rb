class PledgesController < ApplicationController
  
  before_filter :require_login 

	def create
  	@project = Project.find(params[:project_id])
  	@pledge = @project.pledges.build params[:pledge]
    @pledge.user = current_user

  	if @pledge.save 
      UserMailer.new_pledge(@pledge).deliver
  		redirect_to @project  
  		flash[:notice] = "Thanks for supporting this project!"
    else
  		render 'projects/show' 
  		#flash[:notice] = "Uups...something went wrong. Try again!"
  	end
  end

end
