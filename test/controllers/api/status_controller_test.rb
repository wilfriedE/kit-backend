require 'test_helper'

class Api::StatusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_status_index_url
    assert_response :success
  end

end
