require 'test_helper'

class BlindTimesControllerTest < ActionController::TestCase
  setup do
    @blind_time = blind_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blind_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blind_time" do
    assert_difference('BlindTime.count') do
      post :create, blind_time: { time: @blind_time.time }
    end

    assert_redirected_to blind_time_path(assigns(:blind_time))
  end

  test "should show blind_time" do
    get :show, id: @blind_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blind_time
    assert_response :success
  end

  test "should update blind_time" do
    put :update, id: @blind_time, blind_time: { time: @blind_time.time }
    assert_redirected_to blind_time_path(assigns(:blind_time))
  end

  test "should destroy blind_time" do
    assert_difference('BlindTime.count', -1) do
      delete :destroy, id: @blind_time
    end

    assert_redirected_to blind_times_path
  end
end
