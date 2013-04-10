module ProjectsHelper

	def amount_raised
  	amount_raised = 0
  	@project.pledges.each do |pledge|
  		amount_raised += pledge.amount 
  	end
  	number_with_delimiter(amount_raised)
  end

end
