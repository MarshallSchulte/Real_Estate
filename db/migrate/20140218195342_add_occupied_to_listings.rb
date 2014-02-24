class AddOccupiedToListings < ActiveRecord::Migration
  def change
    add_column :listings, :occupied, :string
  end
end
