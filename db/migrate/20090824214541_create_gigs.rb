class CreateGigs < ActiveRecord::Migration
  def self.up
    create_table :gigs do |t|
      t.integer :venue_id,    :null => false  
      t.integer :band_id,     :null => false
      t.date    :date,        :date
      t.time    :time,        :time
      t.string  :event,       :default => ""
      t.string  :street,      :default => ""
      t.string  :city,        :default => ""
      t.string  :state,       :default => ""
      t.string  :zip_code,    :default => ""
      t.text    :description, :default => "" 
      t.timestamps
    end
  end

  def self.down
    drop_table :gigs
  end
end
