require 'test_helper'

class TourPricesControllerTest < ActionController::TestCase
  setup do
    @tour_price = tour_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tour_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour_price" do
    assert_difference('TourPrice.count') do
      post :create, tour_price: { currency: @tour_price.currency, duration: @tour_price.duration, name: @tour_price.name, price_adult: @tour_price.price_adult, price_child: @tour_price.price_child }
    end

    assert_redirected_to tour_price_path(assigns(:tour_price))
  end

  test "should show tour_price" do
    get :show, id: @tour_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour_price
    assert_response :success
  end

  test "should update tour_price" do
    patch :update, id: @tour_price, tour_price: { currency: @tour_price.currency, duration: @tour_price.duration, name: @tour_price.name, price_adult: @tour_price.price_adult, price_child: @tour_price.price_child }
    assert_redirected_to tour_price_path(assigns(:tour_price))
  end

  test "should destroy tour_price" do
    assert_difference('TourPrice.count', -1) do
      delete :destroy, id: @tour_price
    end

    assert_redirected_to tour_prices_path
  end
end
