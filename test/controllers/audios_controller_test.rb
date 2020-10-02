require 'test_helper'

class AudiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get audios_index_url
    assert_response :success
  end

  test "should get show" do
    get audios_show_url
    assert_response :success
  end

  test "should get destroy" do
    get audios_destroy_url
    assert_response :success
  end

end
