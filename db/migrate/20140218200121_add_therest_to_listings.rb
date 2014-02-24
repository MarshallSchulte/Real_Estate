class AddTherestToListings < ActiveRecord::Migration
  def change
    add_column :listings, :basement, :string
    add_column :listings, :fireplace, :string
    add_column :listings, :backyard, :string
    add_column :listings, :county, :string
    add_column :listings, :subdivision, :string
    add_column :listings, :ac, :string
  end
end
