require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "the index page lists all our projects" do
  	project1 = FactoryGirl.create(:project)
  	project2 = FactoryGirl.create(:project, title: "Waterproof Whiteboard")
  	project3 = FactoryGirl.create(:project, title: "Something else")
  	visit '/projects'
		assert page.has_content?('Listing projects')
		assert page.has_content?('Wifi-enabled shoes')
		assert page.has_content?('Waterproof Whiteboard')
		assert page.has_content?('Something else')
  end


end
