require 'test_helper'

class PageFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "can see homepage" do
    get "/"
    assert_response :success
    assert_select "h1", "COURSE SEARCH"
  end

  test "users/show" do
    get "/users/show"
    assert_response :success
  end
end
