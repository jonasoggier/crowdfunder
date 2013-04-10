require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  
  test "the index page lists all our projects" do
  	project1 = FactoryGirl.create(:project)
  	project2 = FactoryGirl.create(:project, title: "Waterproof Whiteboard")
  	project3 = FactoryGirl.create(:project, title: "Something else")
  	visit '/projects'
		assert page.has_content?('Listing projects')
		assert page.has_content?('Wifi-enabled shoes')
		assert page.has_content?('Waterproof Whiteboard')
		assert page.has_content?('Something else')

		# Go to the project details (show) page
		click_link "Waterproof Whiteboard"
		assert_equal project_path(project2), current_path
		assert find("h1:first").has_content? project2.title
  end

  test "navigation" do
  	visit '/'
		assert_equal root_path, current_path
		assert_equal "Home", find("ul.nav li.active a").text

		visit '/projects'
		assert_equal projects_path, current_path
		assert_equal "Projects", find("ul.nav li.active a").text
  end

  test "show page" do
  	project1 = FactoryGirl.create(:project, id: 1)
   	visit '/projects/1'
		assert page.has_content?('Wifi-enabled shoes')
  end

end
