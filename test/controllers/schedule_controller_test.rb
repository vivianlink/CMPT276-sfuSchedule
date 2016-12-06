require 'test_helper'

class ScheduleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should do nothing, but should not give an error" do
    session[:user_name] = users(:one).username
    session[:user_id] = users(:one).id
    get :p2
    assert_response :success
  end


end
