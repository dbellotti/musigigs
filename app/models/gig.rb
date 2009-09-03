class Gig < ActiveRecord::Base
  belongs_to :bands
  belongs_to :venues
  
  TEXT_ROWS = 10
  TEXT_COLS = 40
  
  ADDRESS_FIELDS = %w( street city state zip_code )
  STRING_FIELDS = %w( event street city state zip_code )
  ZIP_CODE_LENGTH = 5
   
  validates_length_of ADDRESS_FIELDS, :maximum => DB_STRING_MAX_LENGTH      
  validates_length_of :description, :maximum => DB_TEXT_MAX_LENGTH
  
  validates_format_of :zip_code, :with => /(^$|^[0-9]{#{ZIP_CODE_LENGTH}}$)/,
                      :message => "must be a five digit number"  
    
  # Return the address (street + city + state + zip).
  def address
    [street, city, state, zip_code].join(", ")
  end   
end
