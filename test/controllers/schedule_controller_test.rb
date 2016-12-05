require 'test_helper'

class ScheduleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get p1" do
    get :p1
    assert_response :success
  end

  # test "should get p2" do
  #   get :p2
  #   assert_response :success
  # end

end
