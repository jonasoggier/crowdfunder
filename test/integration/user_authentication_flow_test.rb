require 'test_helper'

class UserAuthenticationFlowTest < ActionDispatch::IntegrationTest

  test "successful registration" do 
    visit "/users/new"
    assert_equal  new_user_path, current_path

    # The signup button should be visible unless already signed in
    assert find('.navbar').has_link?('Sign Up')

    user = FactoryGirl.build(:user) 

    fill_in "user[email]", :with => user.email
    fill_in "user[first_name]", :with => user.first_name
    fill_in "user[last_name]", :with => user.last_name
    fill_in "user[password]", :with => user.password
    click_button "Create Account"

    assert_equal root_path, current_path
    assert page.has_content?("Account created")

    # No sign up button, logout button instead
    assert find('.navbar').has_no_link?('Sign Up')
    assert find('.navbar').has_link?('Logout')
  end

  test "failed registration" do 
    visit "/users/new"
    user = FactoryGirl.build(:user) 
    fill_in "user[email]", :with => user.email
    click_button "Create Account"
    assert_equal users_path, current_path
    assert page.has_no_content?("Account created")
    assert find('.alert').has_content?("prohibited")
  end

  test "successful logout" do
    # Need to handle JS for logout button, since it uses `method: delete` Rails UJS helper    
    Capybara.current_driver = Capybara.javascript_driver
    user = setup_signed_in_user
    visit '/'
    find('.navbar').click_link 'Logout'
    assert page.has_content?("Bye")
    assert find('.navbar').has_no_link?('Logout')
  end

 	test "successful log in" do
	  visit '/'
	  assert find('.navbar').has_no_link?('Logout')
	  user = setup_signed_in_user
	  assert find('.navbar').has_link?('Logout')
  end

 	test "unsuccessful log in" do
    visit '/session/new'
    fill_in "email", with: "a@b.com"
    fill_in "password", with: "invalid creds"
    click_button "Login"
    assert_equal session_path, current_path
    assert page.has_content?('Invalid credentials')
  end

end