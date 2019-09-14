require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get result" do
    get results_result_url
    assert_response :success
  end

end
