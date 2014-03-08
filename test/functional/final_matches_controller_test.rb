require 'test_helper'

class FinalMatchesControllerTest < ActionController::TestCase
  setup do
    @final_match = final_matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:final_matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create final_match" do
    assert_difference('FinalMatch.count') do
      post :create, final_match: { game: @final_match.game, opponent: @final_match.opponent, player: @final_match.player, time: @final_match.time, winner: @final_match.winner }
    end

    assert_redirected_to final_match_path(assigns(:final_match))
  end

  test "should show final_match" do
    get :show, id: @final_match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @final_match
    assert_response :success
  end

  test "should update final_match" do
    put :update, id: @final_match, final_match: { game: @final_match.game, opponent: @final_match.opponent, player: @final_match.player, time: @final_match.time, winner: @final_match.winner }
    assert_redirected_to final_match_path(assigns(:final_match))
  end

  test "should destroy final_match" do
    assert_difference('FinalMatch.count', -1) do
      delete :destroy, id: @final_match
    end

    assert_redirected_to final_matches_path
  end
end
