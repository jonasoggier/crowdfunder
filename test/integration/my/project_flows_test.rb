require 'test_helper'

class My::ProjectFlowsTest < ActionDispatch::IntegrationTest

  test "there is a my projects link in the nav bar" do
    setup_signed_in_user
    visit "/"
    assert find('.navbar').has_link?('My Projects')
  end

  test "the my projects link is not there when I log out" do
    visit "/"
    assert_false find('.navbar').has_link?('My Projects')
  end

  test "the my projects link is active when I visit the my projects page" do
   setup_signed_in_user
   visit my_projects_path
   assert_equal find("ul.nav li.active a").text, "My Projects"
  end

  test "the my projects page lists all of my projects" do
    user = setup_signed_in_user
    5.times { FactoryGirl.create(:project, :user => user)}
    other_user = FactoryGirl.create(:user)
    FactoryGirl.create(:project, :user => other_user, :title => "Not my project")

    visit my_projects_path

    user.projects.each do |project|
      assert page.has_content?(project.title)
    end
    
    assert page.has_no_content?("Not my project")
  end

  test "there is a Create Project button when I visit the My Project page" do
    setup_signed_in_user
    visit my_projects_path
    assert page.has_content?("Create New Project")
  end

  test "redirect to create project page when button is clicked" do
    setup_signed_in_user
    visit my_projects_path
    click_on("Create New Project")
    assert page.has_content?("Create a new project")
  end

  test "redirect to project page when new project is created" do
    setup_signed_in_user
    visit new_my_project_path
    fill_in "project[title]", :with => "TestTitle"
    fill_in "project[teaser]", :with => "TestTeaser"
    fill_in "project[description]", :with => "TestDescription"
    fill_in "project[goal]", :with => 999
    click_button "Create New Project"
    assert page.has_content?("Project successfully created")
  end

  test "there is a Delete Project button when I visit the Edit Project page" do
    setup_signed_in_user
    project = FactoryGirl.create(:project)
    visit edit_my_project_path(project)
    assert page.has_link?("Delete This Project")
  end

  test "redirect to My Project index page when delete button is clicked" do
    setup_signed_in_user
    project = FactoryGirl.create(:project)
    visit edit_my_project_path(project)
    click_link("Delete This Project")
    click_on("Yes")
    assert page.has_content?("Project was successfully deleted")
  end

end