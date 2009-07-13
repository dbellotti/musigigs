class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :full_name
      t.string :user_name
      t.string :hashed_password
      t.string :salt      
      t.string :email
      t.string :entity_type
      t.string :entity_title
      t.string :city
      t.string :zip
      t.string :state
      t.string :phone
      t.string :image
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
