require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "checking login/signup" do
  	# test logged out
	session[:user_name] = nil
	session[:user_id] = nil
	get :index

	assert_select "a", {count: 1, text: "Sign Up"}
	assert_select "a", {count: 1, text: "Login"}
	assert_select "a", {count: 0, text: "Logout"}
	assert_select "a", {count: 0, text: "Become Admin"}

	# test logged in
	session[:user_name] = "tester"
	session[:user_id] = 1
	get :index

	assert_select "a", {count: 0, text: "Sign Up"}
	assert_select "a", {count: 0, text: "Login"}
	assert_select "a", {count: 1, text: "Logout"}
	assert_select "a", {count: 1, text: "Become Admin"}
	assert_select "a", {count: 1, text: session[:user_name]}
  end


   test "search table" do
    get :index
    assert_response :success
    assert_select "td", {count: 1, text: "Year:"}
    assert_select "td", {count: 1, text: "Semester:"}
    assert_select "td", {count: 1, text: "Faculty:"}
    assert_select "td", {count: 1, text: "Number:"}
    assert_select "td", {count: 1, text: "Unit:"}
    assert_select "td", {count: 1, text: "Professor:"}
    assert_select "td", {count: 1, text: "Designation:"}
    assert_select "td", {count: 1, text: "Schedule Days:"}
  end



end
