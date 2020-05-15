require 'test_helper'

class Api::V1::UserdetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_userdetails_index_url
    assert_response :success
  end

end
