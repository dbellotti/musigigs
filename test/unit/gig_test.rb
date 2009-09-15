require 'test_helper'

class GigTest < ActiveSupport::TestCase
  fixtures :users, :venues, :gigs

  def setup  
    @error_messages = I18n.translate('activerecord.errors.messages')
    @valid_gig = gigs(:valid_gig)
    @invalid_gig = gigs(:invalid_gig)
    @blank_gig = gigs(:blank_gig)
  end
  
  # This gig should be valid by construction.
  test "gig validity" do
    assert @valid_gig.valid?, @valid_gig.errors.full_messages.join("\n")
  end
  
  # This gig should be invalid by construction.
  test "gig invalidity" do
    assert !@invalid_gig.valid?
    assert @invalid_gig.errors.invalid?(:zip_code)
  end    
  
  test "max lengths" do 
    Gig::STRING_FIELDS.each do |field|
      assert_length :max, @valid_gig, field, DB_STRING_MAX_LENGTH
    end
    assert_length :max, @valid_gig, :description, DB_TEXT_MAX_LENGTH
  end
  
  # Test a saving a blank gig.
  test "blank gig" do
    blank = Gig.new(:id => @blank_gig.id, 
                    :venue_id => @blank_gig.venue_id, 
                    :band_id => @blank_gig.band_id, 
                    :time => @blank_gig.time)    
    assert blank.save, blank.errors.full_messages.join("\n")
  end
     
  # Test the zip code validation with valid examples.
  test "zip code with valid examples" do
    gig = @valid_gig
    valid_zip_codes = %w{91125 90210 24601 02138}
    valid_zip_codes.each do |zip_code|
      gig.zip_code = zip_code
      assert gig.valid?, "#{zip_code} should pass validation, but doesn't." 
    end  
  end
  
  # Test the zip code validation with invalid examples.
  test "zip code with invalid examples" do
    gig = @valid_gig
    invalid_zip_codes = %w{OU812 5150 314159}
    invalid_zip_codes.each do |zip_code|
      gig.zip_code = zip_code
      assert !gig.valid?, "#{zip_code} shouldn't pass validation, but does." 
    end
  end
  
  # Test for valid genders.
  test "time with valid examples" do
    gig = @valid_gig
    Gig::VALID_DATES.each do |valid_time|
      gig.time = valid_time
      assert gig.valid?, "#{valid_time} should pass validation but doesn't." 
    end
  end
  
  # Test invalid genders.
  test "time with invalid examples" do
    gig = @valid_gig
    invalid_times = ["Eunuch", "Hermaphrodite", "Ann Coulter"]
    invalid_times.each do |invalid_time|
      gig.time = invalid_time
      assert !gig.valid?, "#{invalid_time} shouldn't pass validation, but does."
    end
  end  
end
