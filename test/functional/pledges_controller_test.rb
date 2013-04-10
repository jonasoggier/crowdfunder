require 'test_helper'

class PledgesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :project_id=> 1
    assert_response :success
  end

  test "should get create" do
    get :create, :project_id=> 1
    assert_response :success
  end

end
