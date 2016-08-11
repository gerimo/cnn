require 'test_helper'

class FanpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fanpage = fanpages(:one)
  end

  test "should get index" do
    get fanpages_url
    assert_response :success
  end

  test "should get new" do
    get new_fanpage_url
    assert_response :success
  end

  test "should create fanpage" do
    assert_difference('Fanpage.count') do
      post fanpages_url, params: { fanpage: { category_id: @fanpage.category_id, facebook_number: @fanpage.facebook_number, name: @fanpage.name } }
    end

    assert_redirected_to fanpage_url(Fanpage.last)
  end

  test "should show fanpage" do
    get fanpage_url(@fanpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_fanpage_url(@fanpage)
    assert_response :success
  end

  test "should update fanpage" do
    patch fanpage_url(@fanpage), params: { fanpage: { category_id: @fanpage.category_id, facebook_number: @fanpage.facebook_number, name: @fanpage.name } }
    assert_redirected_to fanpage_url(@fanpage)
  end

  test "should destroy fanpage" do
    assert_difference('Fanpage.count', -1) do
      delete fanpage_url(@fanpage)
    end

    assert_redirected_to fanpages_url
  end
end
