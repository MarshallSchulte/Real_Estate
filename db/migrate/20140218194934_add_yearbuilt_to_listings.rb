class AddYearbuiltToListings < ActiveRecord::Migration
  def change
    add_column :listings, :yearbuilt, :string
  end
end
