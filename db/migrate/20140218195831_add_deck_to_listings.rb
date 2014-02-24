class AddDeckToListings < ActiveRecord::Migration
  def change
    add_column :listings, :deck, :string
  end
end
