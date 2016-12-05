require 'test_helper'

class PageFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "homepage" do
    get "/welcome"
    assert_response :success
    assert_select "h1", "COURSE SEARCH"
  end

  test "profile page" do
    get "/users/show"
    assert_response :success
  end

  test "schedule page" do
    get "/schedule"
    assert_response :success
  end

  test "course list page" do
    get "/courses"
    assert_response :success
  end

  test "rate a professor page" do
    get "/prof"
    assert_response :success
  end

  test "urlConstruct page" do
    get "/urlConstruct"
    assert_response :success
  end

  test "Show User page" do
    get "/users"
    assert_response :success
  end

  test "Sign up page" do
    get "/users/new"
    assert_response :success
  end

  test "Admin User page" do
    get "/admin/new"
    assert_response :success
  end

  test "Log in page" do
    get "/sessions/login"
    assert_response :success
  end
end
