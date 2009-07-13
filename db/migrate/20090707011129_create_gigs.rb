class CreateGigs < ActiveRecord::Migration
  def self.up
    create_table :gigs do |t|
      t.string :band_title
      t.string :venue_title
      t.date :date
      t.time :time

      t.timestamps
    end
  end

  def self.down
    drop_table :gigs
  end
end
