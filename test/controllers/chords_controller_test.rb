require 'test_helper'

class ChordsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get chords_update_url
    assert_response :success
  end

end
