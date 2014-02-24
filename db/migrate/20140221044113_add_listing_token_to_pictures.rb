class AddListingTokenToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :listing_token, :string
  end
end
