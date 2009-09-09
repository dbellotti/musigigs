class Gig < ActiveRecord::Base
  belongs_to :bands
  belongs_to :venues
  
  #attr_accessor :time
  
  TEXT_ROWS = 10
  TEXT_COLS = 40
  
  ADDRESS_FIELDS = %w( street city state zip_code )
  STRING_FIELDS = %w( event street city state zip_code )
  ZIP_CODE_LENGTH = 5
   
  validates_length_of ADDRESS_FIELDS, :maximum => DB_STRING_MAX_LENGTH      
  validates_length_of :description, :maximum => DB_TEXT_MAX_LENGTH
  
  validates_format_of :zip_code, :with => /(^$|^[0-9]{#{ZIP_CODE_LENGTH}}$)/,
                      :message => "must be a five digit number"  
                      
  validates_datetime :time
    
  def self.collect_all_for(user)
    gigs_list = []
    user.bands.each do |band|
      band.gigs.each do |gig|
        gigs_list << gig
      end
    end
    user.venues.each do |venue|
      venue.gigs.each do |gig|
        gigs_list << gig
      end
    end
    return gigs_list
  end  
  
  # Return the address (street + city + state + zip).
  def address
    [street, city, state, zip_code].join(", ")
  end   
  
  def date
    time.strftime('%m/%d/%y')
  end
  
  def start_time
    time.strftime('%H:%M')
  end

end
