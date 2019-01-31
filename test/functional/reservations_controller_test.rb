require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post :create, reservation: { chambre_reserve_id: @reservation.chambre_reserve_id, date_arrive: @reservation.date_arrive, date_depart: @reservation.date_depart, demande_particuliere: @reservation.demande_particuliere, price: @reservation.price, type_de_chambre: @reservation.type_de_chambre, type_de_vue: @reservation.type_de_vue, user_age: @reservation.user_age, user_email: @reservation.user_email, user_id: @reservation.user_id, user_name: @reservation.user_name }
    end

    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should show reservation" do
    get :show, id: @reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation
    assert_response :success
  end

  test "should update reservation" do
    put :update, id: @reservation, reservation: { chambre_reserve_id: @reservation.chambre_reserve_id, date_arrive: @reservation.date_arrive, date_depart: @reservation.date_depart, demande_particuliere: @reservation.demande_particuliere, price: @reservation.price, type_de_chambre: @reservation.type_de_chambre, type_de_vue: @reservation.type_de_vue, user_age: @reservation.user_age, user_email: @reservation.user_email, user_id: @reservation.user_id, user_name: @reservation.user_name }
    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete :destroy, id: @reservation
    end

    assert_redirected_to reservations_path
  end
end
