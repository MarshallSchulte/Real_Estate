class AddListingIdToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :listing_id, :integer
  end
end
