class AddPoolToListings < ActiveRecord::Migration
  def change
    add_column :listings, :pool, :string
  end
end
