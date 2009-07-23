class AddInfoToGigs < ActiveRecord::Migration
  def self.up
    add_column :gigs, :info, :text
  end

  def self.down
    remove_column :gigs, :info
  end
end
