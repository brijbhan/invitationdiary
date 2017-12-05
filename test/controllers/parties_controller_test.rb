require 'test_helper'

class PartiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parties_url
    assert_response :success
  end

  test "should get new" do
    get new_party_url
    assert_response :success
  end

end
