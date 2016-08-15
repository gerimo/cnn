require 'test_helper'

class FbTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fb_token = fb_tokens(:one)
  end

  test "should get index" do
    get fb_tokens_url
    assert_response :success
  end

  test "should get new" do
    get new_fb_token_url
    assert_response :success
  end

  test "should create fb_token" do
    assert_difference('FbToken.count') do
      post fb_tokens_url, params: { fb_token: { token: @fb_token.token } }
    end

    assert_redirected_to fb_token_url(FbToken.last)
  end

  test "should show fb_token" do
    get fb_token_url(@fb_token)
    assert_response :success
  end

  test "should get edit" do
    get edit_fb_token_url(@fb_token)
    assert_response :success
  end

  test "should update fb_token" do
    patch fb_token_url(@fb_token), params: { fb_token: { token: @fb_token.token } }
    assert_redirected_to fb_token_url(@fb_token)
  end

  test "should destroy fb_token" do
    assert_difference('FbToken.count', -1) do
      delete fb_token_url(@fb_token)
    end

    assert_redirected_to fb_tokens_url
  end
end
