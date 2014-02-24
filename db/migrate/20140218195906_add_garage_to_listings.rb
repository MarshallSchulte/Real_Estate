class AddGarageToListings < ActiveRecord::Migration
  def change
    add_column :listings, :garage, :string
  end
end
