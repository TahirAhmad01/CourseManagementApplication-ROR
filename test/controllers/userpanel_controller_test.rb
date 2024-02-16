require "test_helper"

class UserpanelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userpanel_index_url
    assert_response :success
  end
end
