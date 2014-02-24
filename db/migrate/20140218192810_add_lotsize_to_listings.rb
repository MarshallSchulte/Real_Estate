class AddLotsizeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :lotsize, :integer
  end
end
