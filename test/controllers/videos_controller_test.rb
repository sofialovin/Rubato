require 'test_helper'

class VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get videos_new_url
    assert_response :success
  end

  test "should get create" do
    get videos_create_url
    assert_response :success
  end

  test "should get update" do
    get videos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get videos_destroy_url
    assert_response :success
  end

end
