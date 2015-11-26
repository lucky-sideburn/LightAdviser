require 'test_helper'

class MykeysControllerTest < ActionController::TestCase
  setup do
    @mykey = mykeys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mykeys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mykey" do
    assert_difference('Mykey.count') do
      post :create, mykey: { content: @mykey.content, user_id: @mykey.user_id }
    end

    assert_redirected_to mykey_path(assigns(:mykey))
  end

  test "should show mykey" do
    get :show, id: @mykey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mykey
    assert_response :success
  end

  test "should update mykey" do
    patch :update, id: @mykey, mykey: { content: @mykey.content, user_id: @mykey.user_id }
    assert_redirected_to mykey_path(assigns(:mykey))
  end

  test "should destroy mykey" do
    assert_difference('Mykey.count', -1) do
      delete :destroy, id: @mykey
    end

    assert_redirected_to mykeys_path
  end
end
