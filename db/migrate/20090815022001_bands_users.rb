class BandsUsers < ActiveRecord::Migration
  def self.up
    create_table :bands_users, :id => false do |t|
      t.column "band_id", :integer, :null => false
      t.column "user_id", :integer, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :bands_users
  end
end
