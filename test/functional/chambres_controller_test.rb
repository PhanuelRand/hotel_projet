require 'test_helper'

class ChambresControllerTest < ActionController::TestCase
  setup do
    @chambre = chambres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chambres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chambre" do
    assert_difference('Chambre.count') do
      post :create, chambre: { name: @chambre.name, type: @chambre.type, vue: @chambre.vue }
    end

    assert_redirected_to chambre_path(assigns(:chambre))
  end

  test "should show chambre" do
    get :show, id: @chambre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chambre
    assert_response :success
  end

  test "should update chambre" do
    put :update, id: @chambre, chambre: { name: @chambre.name, type: @chambre.type, vue: @chambre.vue }
    assert_redirected_to chambre_path(assigns(:chambre))
  end

  test "should destroy chambre" do
    assert_difference('Chambre.count', -1) do
      delete :destroy, id: @chambre
    end

    assert_redirected_to chambres_path
  end
end
