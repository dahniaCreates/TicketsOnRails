require "test_helper"

class OfficersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get officers_index_url
    assert_response :success
  end

  test "should get show" do
    get officers_show_url
    assert_response :success
  end
end
