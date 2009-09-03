class Band < ActiveRecord::Base
  has_many :gigs
  has_many :venues, :through => :gigs
  
  has_and_belongs_to_many :users
  
  TEXT_ROWS = 10
  TEXT_COLS = 40
  
  BASIC_FIELDS = %w(name genre)
  
  validates_uniqueness_of :name
  
  validates_length_of BASIC_FIELDS, :maximum => DB_STRING_MAX_LENGTH      
  validates_length_of :description, :maximum => DB_TEXT_MAX_LENGTH
   
end
