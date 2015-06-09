require 'test_helper'

class CalendarRequestsControllerTest < ActionController::TestCase
  setup do
    @calendar_request = calendar_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendar_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendar_request" do
    assert_difference('CalendarRequest.count') do
      post :create, calendar_request: { tour_id: @calendar_request.tour_id, user_id: @calendar_request.user_id }
    end

    assert_redirected_to calendar_request_path(assigns(:calendar_request))
  end

  test "should show calendar_request" do
    get :show, id: @calendar_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calendar_request
    assert_response :success
  end

  test "should update calendar_request" do
    patch :update, id: @calendar_request, calendar_request: { tour_id: @calendar_request.tour_id, user_id: @calendar_request.user_id }
    assert_redirected_to calendar_request_path(assigns(:calendar_request))
  end

  test "should destroy calendar_request" do
    assert_difference('CalendarRequest.count', -1) do
      delete :destroy, id: @calendar_request
    end

    assert_redirected_to calendar_requests_path
  end
end
