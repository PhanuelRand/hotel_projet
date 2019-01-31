require 'test_helper'

class ChambreReservesControllerTest < ActionController::TestCase
  setup do
    @chambre_reserf = chambre_reserves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chambre_reserves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chambre_reserf" do
    assert_difference('ChambreReserve.count') do
      post :create, chambre_reserf: { chambre_id: @chambre_reserf.chambre_id }
    end

    assert_redirected_to chambre_reserf_path(assigns(:chambre_reserf))
  end

  test "should show chambre_reserf" do
    get :show, id: @chambre_reserf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chambre_reserf
    assert_response :success
  end

  test "should update chambre_reserf" do
    put :update, id: @chambre_reserf, chambre_reserf: { chambre_id: @chambre_reserf.chambre_id }
    assert_redirected_to chambre_reserf_path(assigns(:chambre_reserf))
  end

  test "should destroy chambre_reserf" do
    assert_difference('ChambreReserve.count', -1) do
      delete :destroy, id: @chambre_reserf
    end

    assert_redirected_to chambre_reserves_path
  end
end
