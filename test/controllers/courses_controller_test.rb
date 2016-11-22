require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Only Show and Back accessible for non admin users" do
    get :index
    assert_response :success
    assert_select "td", {count: Course.all.count, text: "Show"}
    assert_select "td", {count: 0, text: "Edit"}
    assert_select "td", {count: 0, text: "Destroy"}
    assert_select "a[href=?]", new_course_path, {count: 0, text: "New course"}
    assert_select "a[href=?]", welcome_index_path, {count: 1, text: "Back"}
    
    session[:user_name] = 1
    session[:user_id] = 1
    get :index
    assert_response :success
    assert_select "td", {count: Course.all.count, text: "Show"}
    assert_select "td", {count: 0, text: "Edit"}
    assert_select "td", {count: 0, text: "Destroy"}
    assert_select "a[href=?]", new_course_path, {count: 0, text: "New course"}
    assert_select "a[href=?]", welcome_index_path, {count: 1, text: "Back"}

    session[:is_admin] = true
    get :index
    assert_response :success
    assert_select "td", {count: Course.all.count, text: "Show"}
    assert_select "td", {count: Course.all.count, text: "Edit"}
    assert_select "td", {count: Course.all.count, text: "Destroy"}
    assert_select "a[href=?]", new_course_path, {count: 1, text: "New course"}
    assert_select "a[href=?]", welcome_index_path, {count: 1, text: "Back"}

    session[:user_name] = nil
    session[:user_id] = nil
    session[:is_admin] = false
  end
end
