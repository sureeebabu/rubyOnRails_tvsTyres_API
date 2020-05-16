require 'test_helper'

class Api::V1::TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get mymethod" do
    get api_v1_tests_mymethod_url
    assert_response :success
  end

end
