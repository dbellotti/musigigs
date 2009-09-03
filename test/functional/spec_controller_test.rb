require 'test_helper'

class SpecControllerTest < ActionController::TestCase
  fixtures :users
  fixtures :specs
  
  def setup
    @controller = SpecController.new
    @request    = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    @user     = users(:valid_user)
    @spec     = specs(:valid_spec)
  end

  def test_index_unauthorized
    get :index
    assert_response :redirect
    assert_redirected_to :controller => "user", :action => "login"
  end

  def test_index
    authorize @user
    get :index
    assert_response :redirect
    assert_redirected_to :controller => "user", :action => "index"
  end

  # Test edit form fields.
  def test_edit_form
    authorize @user
    get :edit
    title = assigns(:title)
    assert_equal "Edit Spec", title
    assert_response :success
    assert_template "edit"

    assert_form_tag "/spec/edit"
    assert_tag "input", :attributes => { :name => "spec[first_name]" }
    assert_tag "input", :attributes => { :name => "spec[last_name]" }
    assert_tag "input",
              :attributes => { :type  => "radio",
                                :name  => "spec[gender]",
                                :value => "Male" }
    assert_tag "input",
              :attributes => { :type  => "radio",
                                :name  => "spec[gender]",
                                :value => "Female" }
    # date assertions are hard, but at least we can check for ~something~
    assert_tag "select", :attributes => { :name => /spec\[birthdate.*\]/ }
    assert_tag "input", :attributes => { :name => "spec[occupation]" }
    assert_tag "input", :attributes => { :name => "spec[zip_code]" }
    assert_submit_button "Update"
  end

  def test_edit_success
    authorize @user
    post :edit,
         :spec => { :first_name  => "new first name",
                     :last_name  => "new last name",
                     :gender     => "Male",
                     :occupation => "new job",
                     :zip_code   => "91125", 
                     :bio        => "new bio" }
    spec = assigns(:spec)
    new_user = User.find(spec.user.id)
    assert_equal new_user.spec, spec
    assert_equal "Changes saved.", flash[:notice]
    assert_response :redirect
    assert_redirected_to :controller => "user", :action => "index"
  end

  def test_edit_failure
    authorize @user
    too_long_string = "a" * (DB_STRING_MAX_LENGTH + 1)
    too_long_text = "a" * (DB_TEXT_MAX_LENGTH + 1)
    post :edit, :spec => { :first_name => too_long_string,
                           :last_name  => too_long_string,
                           :occupation => too_long_string,
                           :gender     => "Hermaphrodite",
                           :city       => too_long_string,
                           :state      => too_long_string,
                           :zip_code   => "bad",
                           :bio        => too_long_text }
    assert_response :success
    assert_template "edit"
    assert_error_explanation
    # Assert that each form field has at least one error displayed.
    tested_fields = %w(first_name last_name occupation gender zip_code)
    tested_fields.each do |field|
      assert_tag "li", :content => /#{field.humanize}/
    end
    
    error_div = { :tag => "div", 
                  :attributes => { :class => "fieldWithErrors" } } 

    # Test to see that the input fields are being wrapped with the correct div.
    Spec::STRING_FIELDS.each do |field|
      assert_input_field "spec[#{field}]", too_long_string, "text",
                         HTML_TEXT_FIELD_SIZE, DB_STRING_MAX_LENGTH,
                         :parent => error_div
    end
 
  end

private

  # Test display of error messages.
  def assert_error_explanation  
    assert_tag "div", :attributes => { :id => "errorExplanation",
                                        :class => "errorExplanation" }
  end

end
