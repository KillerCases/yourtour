require 'test_helper'

class TourCitiesControllerTest < ActionController::TestCase
  setup do
    @tour_city = tour_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tour_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour_city" do
    assert_difference('TourCity.count') do
      post :create, tour_city: { city: @tour_city.city, country: @tour_city.country }
    end

    assert_redirected_to tour_city_path(assigns(:tour_city))
  end

  test "should show tour_city" do
    get :show, id: @tour_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour_city
    assert_response :success
  end

  test "should update tour_city" do
    patch :update, id: @tour_city, tour_city: { city: @tour_city.city, country: @tour_city.country }
    assert_redirected_to tour_city_path(assigns(:tour_city))
  end

  test "should destroy tour_city" do
    assert_difference('TourCity.count', -1) do
      delete :destroy, id: @tour_city
    end

    assert_redirected_to tour_cities_path
  end
end
