class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string  :name,        :default => ""  
      t.string  :street,      :default => ""
      t.string  :city,        :default => ""
      t.string  :state,       :default => ""
      t.string  :zip_code,    :default => ""    
      t.text    :description, :default => ""
      
      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
