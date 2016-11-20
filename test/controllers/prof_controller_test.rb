require 'test_helper'

class ProfControllerTest < ActionController::TestCase
  test "index test" do
      # test logged out
      session[:user_name] = nil
      session[:user_id] = nil
      get :index

      assert_select "table.prof-search", {count: 1}
      assert_select "td", {minimum: 1}

      # test logged in
      session[:user_name] = 1
      session[:user_id] = 1
      get :index

      assert_select "table.prof-search", {count: 1}
      assert_select "td", {minimum: 1}
  end

  test "for show prof controller" do
    profs_to_test = ["Chun Chan", "AR Jones", "David Mitchell", "Peter Klein"]

    profs_to_test.each do |prof_name|
      # test logged out
      session[:user_name] = nil
      session[:user_id] = nil
      get :show, :prof_name => prof_name

      assert_select "div.login-notice", {count: 1}
      assert_select "select#rating", {count: 0}
      assert_select "textarea#comment", {count: 0}
      assert_select "input.submit-button", {count: 0}

      # test logged in
      session[:user_name] = 1
      session[:user_id] = 1
      get :show, :prof_name => prof_name

      assert_select "div.login-notice", {count: 0}
      assert_select "select#rating", {count: 1}
      assert_select "textarea#comment", {count: 1}
      assert_select "input.submit-button", {count: 1}
    end

    assert_response :success
  end

end
