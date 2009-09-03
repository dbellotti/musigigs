require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  fixtures :users, :venues

  def setup  
    @error_messages = I18n.translate('activerecord.errors.messages')
    @valid_venue = venues(:valid_venue)
    @invalid_venue = venues(:invalid_venue)
    @blank_venue = venues(:blank_venue)
  end
  
  # This venue should be valid by construction.
  def test_venue_validity
    assert @valid_venue.valid?
  end
  
  # This venue should be invalid by construction.
  def test_venue_invalidity    
    assert !@invalid_venue.valid?
    assert @invalid_venue.errors.invalid?(:zip_code)
  end    
  
  def test_max_lengths
    Venue::STRING_FIELDS.each do |field|
      assert_length :max, @valid_venue, field, DB_STRING_MAX_LENGTH
    end
    assert_length :max, @valid_venue, :description, DB_TEXT_MAX_LENGTH
  end
  
  # Test a saving a blank venue.
  def test_blank
    blank = Venue.new(:id => @blank_venue)    
    assert !blank.save, blank.errors.full_messages.join("\n")
  end
  
  def test_uniqueness_of_venue_name
    venue_repeat = Venue.new( :name => @valid_venue.name )                              
    assert !venue_repeat.valid?
    assert_equal @error_messages[:taken], venue_repeat.errors.on(:name)
  end   
    
  # Test the zip code validation with valid examples.
  def test_zip_code_with_valid_examples
    venue = @valid_venue
    valid_zip_codes = %w{91125 90210 24601 02138}
    valid_zip_codes.each do |zip_code|
      venue.zip_code = zip_code
      assert venue.valid?, "#{zip_code} should pass validation, but doesn't." 
    end  
  end
  
  # Test the zip code validation with invalid examples.
  def test_zip_code_with_invalid_examples
    venue = @valid_venue
    invalid_zip_codes = %w{OU812 5150 314159}
    invalid_zip_codes.each do |zip_code|
      venue.zip_code = zip_code
      assert !venue.valid?, "#{zip_code} shouldn't pass validation, but does." 
    end
  end
  
end
