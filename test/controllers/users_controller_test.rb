require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show message if not logged in" do
    get :show
    assert_response :success
    assert_select "p", {count: 1, text: "You are not logged in. No profile to show."}
  end

  test "should show user info if logged in" do
    session[:user_name] = users(:one).username
    session[:user_id] = users(:one).id
    get :show
    assert_response :success
    assert_select "p", {count: 1, text: "Hello " + users(:one).username + ", this is your profile:"}
    assert_select "p[2]", {count: 1, text: "Name: " + users(:one).username}
    assert_select "p[3]", {count: 1, text: "Email: " + users(:one).email}
  end

  test "should show course if user adds a course" do
    session[:user_name] = users(:one).username
    session[:user_id] = users(:one).id
    get :show
    assert_response :success
    assert_select "th", {count: 0, text: "faculty"}
    assert_select "th", {count: 0, text: "number"}
    assert_select "th", {count: 0, text: "unit"}
    assert_select "th", {count: 0, text: "designation"}
    assert_select "th", {count: 0, text: "year"}
    assert_select "th", {count: 0, text: "semester"}
    assert_select "td", {count: 0, text: courses(:one).faculty}
    assert_select "td", {count: 0, text: courses(:one).number}
    assert_select "td", {count: 0, text: courses(:one).unit}
    assert_select "td", {count: 0, text: courses(:one).designation}
    assert_select "td", {count: 0, text: courses(:one).year}
    assert_select "td", {count: 0, text: courses(:one).semester}
    assert_select "td", {count: 0, text: "Remove"}
    assert_select "td", {count: 0, text: "Show"}
    users(:one).course << courses(:one)
    get :show
    assert_response :success
    assert_select "th", {count: 1, text: "faculty"}
    assert_select "th", {count: 1, text: "number"}
    assert_select "th", {count: 1, text: "unit"}
    assert_select "th", {count: 1, text: "designation"}
    assert_select "th", {count: 1, text: "year"}
    assert_select "th", {count: 1, text: "semester"}
    assert_select "td", {count: 1, text: courses(:one).faculty}
    assert_select "td", {count: 1, text: courses(:one).number}
    assert_select "td", {count: 1, text: courses(:one).unit}
    assert_select "td", {count: 1, text: courses(:one).designation}
    assert_select "td", {count: 1, text: courses(:one).year}
    assert_select "td", {count: 1, text: courses(:one).semester}
    assert_select "td", {count: 1, text: "Remove"}
    assert_select "td", {count: 1, text: "Show"}
  end

  test "should show tutorial if user adds a tutorial" do
    session[:user_name] = users(:one).username
    session[:user_id] = users(:one).id
    get :show
    assert_response :success
    assert_select "th", {count: 0, text: "Name"}
    assert_select "th", {count: 0, text: "Detail"}
    assert_select "td", {count: 0, text: tutorials(:one).tutname}
    assert_select "td", {count: 0, text: tutorials(:one).tutschedule}
    assert_select "td", {count: 0, text: "Remove"}
    users(:one).tutorial << tutorials(:one)
    get :show
    assert_response :success
    assert_select "th", {count: 1, text: "Name"}
    assert_select "th", {count: 1, text: "Detail"}
    assert_select "td", {count: 1, text: tutorials(:one).tutname}
    assert_select "td", {count: 1, text: tutorials(:one).tutschedule}
    assert_select "td", {count: 1, text: "Remove"}

  end

end
