require 'test_helper'

class BandTest < ActiveSupport::TestCase
  fixtures :bands, :users
  
  def setup
    @error_messages = I18n.translate('activerecord.errors.messages')  
    @valid_band = bands(:valid_band)
    @blank_band = bands(:blank_band)
  end
  
  def test_max_lengths  
    Band::BASIC_FIELDS.each do |field|
      assert_length :max, @valid_band, field, DB_STRING_MAX_LENGTH
    end
    assert_length :max, @valid_band, :description, DB_TEXT_MAX_LENGTH
  end
  
  def test_band_validity
    assert @valid_band.valid?
  end
  
  def test_uniqueness_of_band_name
    band_repeat = Band.new( :name => @valid_band.name )                              
    assert !band_repeat.valid?
    assert_equal @error_messages[:taken], band_repeat.errors.on(:name)
  end   
  
end
