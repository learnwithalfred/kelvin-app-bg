require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get def" do
    get homes_def_url
    assert_response :success
  end
end
