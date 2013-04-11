require 'test_helper'

class PledgeFlowsTest < ActionDispatch::IntegrationTest
  
	setup do
		@project = FactoryGirl.create :project		
	end

	test "requires authenticated user" do 
		visit project_path(@project)

		click_on 'Pledge Now'

		assert_equal new_session_path, current_path
		assert page.has_content?("Please login first.")
	end

	test "authenticated user can pledge valid amount" do 
  	user = setup_signed_in_user
		
		visit project_path(@project)
		fill_in 'pledge[amount]', with: 100
		click_on 'Pledge Now'	
		
		assert_equal project_path(@project), current_path
		assert page.has_content?("Thanks for supporting this project!")

		# Verify that the pledge was created with the right attributes
		pledge = Pledge.order(:id).last
		assert_equal user, pledge.user
		assert_equal @project, pledge.project
		assert_equal 100, pledge.amount

		# An email should be delivered to the project owner
		#assert_equal [@project.user.email], last_email.to

	end

end