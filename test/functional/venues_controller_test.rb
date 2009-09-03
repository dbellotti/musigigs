require 'test_helper'

class VenuesControllerTest < ActionController::TestCase
  fixtures :users
  fixtures :venues
  
  def setup
    @controller = VenuesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @user       = users(:valid_user)
    @venue       = venues(:valid_venue)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venues)
  end

  test "should get new" do
    authorize @user
    get :new
    assert_response :success
  end

  test "should create venue" do
    authorize @user
    assert_difference('Venue.count') do
      post :create, :venue => { :name => "new name" }
    end

    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should show venue" do
    authorize @user
    get :show, :id => @venue.to_param
    assert_response :success
  end

  test "should get edit" do
    authorize @user
    get :edit, :id => @venue.to_param
    assert_response :success
  end

  test "should update venue" do
    authorize @user
    put :update, :id => @venue.to_param, :venue => { :name => "new name",
                                                     :street => "new street" }
    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should destroy venue" do
    authorize @user
    assert_difference('Venue.count', -1) do
      delete :destroy, :id => @venue.to_param
    end

    assert_redirected_to hub_url
  end
  
end
