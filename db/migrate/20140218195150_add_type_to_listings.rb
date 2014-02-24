class AddTypeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :type, :string
  end
end
