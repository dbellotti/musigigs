class Gig < ActiveRecord::Base
  has_and_belongs_to_many :user
    
  def self.search_by_band(search)
    if search
      find(:all, :conditions => ['band_title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def self.search_by_date(search)
    if search
      find(:all, :conditions => ['date LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
