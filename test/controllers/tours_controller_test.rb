require 'test_helper'

class ToursControllerTest < ActionController::TestCase
  setup do
    @tour = tours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour" do
    assert_difference('Tour.count') do
<<<<<<< HEAD
      post :create, tour: { created_at: @tour.created_at, name: @tour.name, short_description: @tour.short_description }
=======
      post :create, tour: { created_at: @tour.created_at, description_short: @tour.description_short, name: @tour.name }
>>>>>>> adding-tours
    end

    assert_redirected_to tour_path(assigns(:tour))
  end

  test "should show tour" do
    get :show, id: @tour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour
    assert_response :success
  end

  test "should update tour" do
<<<<<<< HEAD
    patch :update, id: @tour, tour: { created_at: @tour.created_at, name: @tour.name, short_description: @tour.short_description }
=======
    patch :update, id: @tour, tour: { created_at: @tour.created_at, description_short: @tour.description_short, name: @tour.name }
>>>>>>> adding-tours
    assert_redirected_to tour_path(assigns(:tour))
  end

  test "should destroy tour" do
    assert_difference('Tour.count', -1) do
      delete :destroy, id: @tour
    end

    assert_redirected_to tours_path
  end
end
