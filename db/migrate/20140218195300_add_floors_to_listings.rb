class AddFloorsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :floors, :integer
  end
end
