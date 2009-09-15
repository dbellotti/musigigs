require 'test_helper'

class GigsControllerTest < ActionController::TestCase
  fixtures :users
  fixtures :venues
  fixtures :gigs
  
  def setup
    @controller = GigsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @user       = users(:valid_user)
    @venue      = venues(:valid_venue)
    @gig        = gigs(:valid_gig)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gigs)
  end

  test "should get new" do
    authorize @user  
    get :new, :id => @venue.to_param
    assert_response :success
  end

  test "should create gig" do
    authorize @user
    assert_difference('Gig.count') do
      post :create, { :venue_id => @venue.id, :gig => { :time => @gig.time } }
    end

    assert_redirected_to gig_path(assigns(:gig))
  end

  test "should show gig" do
    authorize @user  
    get :show, :id => @gig.to_param
    assert_response :success
  end

  test "should get edit" do
    authorize @user  
    get :edit, :id => @gig.to_param
    assert_response :success
  end

  test "should update gig" do
    authorize @user  
    put :update, :id => @gig.to_param, :gig => { :event => 'new name' }
    assert_redirected_to gig_path(assigns(:gig))
  end

  test "should destroy gig" do
    authorize @user 
    assert_difference('Gig.count', -1) do
      delete :destroy, :id => @gig.to_param
    end

    assert_redirected_to gigs_path
  end
 
end
