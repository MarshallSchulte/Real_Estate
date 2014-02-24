class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.integer :price
      t.integer :beds
      t.integer :bathrooms
      t.integer :sqft
      t.string :addinfo
      t.integer :user_id

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
