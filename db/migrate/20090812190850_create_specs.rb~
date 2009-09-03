class CreateSpecs < ActiveRecord::Migration
  def self.up
    create_table :specs do |t|
      t.integer :user_id,    :null => false
      t.string  :first_name, :default => ""
      t.string  :last_name,  :default => ""
      t.string  :gender     
      t.date    :birthdate,  :date
      t.string  :occupation, :default => ""
      t.string  :city,       :default => ""
      t.string  :state,      :default => ""
      t.string  :zip_code,   :default => ""
      t.text    :bio,        :default => "" 

      t.timestamps
    end
  end

  def self.down
    drop_table :specs
  end
end
