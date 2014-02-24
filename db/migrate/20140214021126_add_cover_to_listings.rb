class AddCoverToListings < ActiveRecord::Migration
  def change
    add_column :listings, :cover, :integer
  end
end
