require 'test_helper'

class GigsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gigs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gig" do
    assert_difference('Gig.count') do
      post :create, :gig => { }
    end

    assert_redirected_to gig_path(assigns(:gig))
  end

  test "should show gig" do
    get :show, :id => gigs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => gigs(:one).to_param
    assert_response :success
  end

  test "should update gig" do
    put :update, :id => gigs(:one).to_param, :gig => { }
    assert_redirected_to gig_path(assigns(:gig))
  end

  test "should destroy gig" do
    assert_difference('Gig.count', -1) do
      delete :destroy, :id => gigs(:one).to_param
    end

    assert_redirected_to gigs_path
  end
end
