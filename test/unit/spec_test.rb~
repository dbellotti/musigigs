require 'test_helper'

class SpecTest < ActiveSupport::TestCase
  fixtures :specs, :users
  
  def setup
    @valid_spec = specs(:valid_spec)
    @blank_spec = specs(:blank_spec)
  end
  
  def test_max_lengths
    Spec::STRING_FIELDS.each do |field|
      assert_length :max, @valid_spec, field, DB_STRING_MAX_LENGTH
    end
    assert_length :max, @valid_spec, :bio, DB_TEXT_MAX_LENGTH
  end
  
  # Test a saving a blank spec.
  def test_blank
    blank = Spec.new(:user_id => @blank_spec.id)
    assert blank.save, blank.errors.full_messages.join("\n")
  end
  
  def test_invalid_birthdates
    spec = @valid_spec
    invalid_birthdates = [Date.new(Spec::START_YEAR - 1),
                          Date.today + 1.year]
    invalid_birthdates.each do |birthdate|
      spec.birthdate = birthdate
      assert !spec.valid?, "#{birthdate} shouldn't pass validation"
    end
  end
  
  # Test the zip code validation with valid examples.
  def test_zip_code_with_valid_examples
    spec = @valid_spec
    valid_zip_codes = %w{91125 90210 24601 02138}
    valid_zip_codes.each do |zip_code|
      spec.zip_code = zip_code
      assert spec.valid?, "#{zip_code} should pass validation, but doesn't." 
    end  
  end
  
  # Test the zip code validation with invalid examples.
  def test_zip_code_with_invalid_examples
    spec = @valid_spec
    invalid_zip_codes = %w{OU812 5150 314159}
    invalid_zip_codes.each do |zip_code|
      spec.zip_code = zip_code
      assert !spec.valid?, "#{zip_code} shouldn't pass validation, but does." 
    end
  end

  # Test for valid genders.
  def test_gender_with_valid_examples
    spec = @valid_spec
    Spec::VALID_GENDERS.each do |valid_gender|
      spec.gender = valid_gender
      assert spec.valid?, "#{valid_gender} should pass validation but doesn't." 
    end
  end
  
  # Test invalid genders.
  def test_gender_with_invalid_examples
    spec = @valid_spec
    invalid_genders = ["Eunuch", "Hermaphrodite", "Ann Coulter"]
    invalid_genders.each do |invalid_gender|
      spec.gender = invalid_gender
      assert !spec.valid?, "#{invalid_gender} shouldn't pass validation, but does."
    end
  end

end
