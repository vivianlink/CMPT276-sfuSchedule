require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get new" do
    get :new

	assert_select "div.Sign_Form", {count: 1}
	assert_select "input#admin_password", {count: 1}

    assert_response :success
  end

end
