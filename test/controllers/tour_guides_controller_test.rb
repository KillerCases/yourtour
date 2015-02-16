require 'test_helper'

class TourGuidesControllerTest < ActionController::TestCase
  setup do
    @tour_guide = tour_guides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tour_guides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour_guide" do
    assert_difference('TourGuide.count') do
      post :create, tour_guide: { description: @tour_guide.description, name: @tour_guide.name }
    end

    assert_redirected_to tour_guide_path(assigns(:tour_guide))
  end

  test "should show tour_guide" do
    get :show, id: @tour_guide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour_guide
    assert_response :success
  end

  test "should update tour_guide" do
    patch :update, id: @tour_guide, tour_guide: { description: @tour_guide.description, name: @tour_guide.name }
    assert_redirected_to tour_guide_path(assigns(:tour_guide))
  end

  test "should destroy tour_guide" do
    assert_difference('TourGuide.count', -1) do
      delete :destroy, id: @tour_guide
    end

    assert_redirected_to tour_guides_path
  end
end
