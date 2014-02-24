class AddListingTokenToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :listing_token, :string
  end
end
