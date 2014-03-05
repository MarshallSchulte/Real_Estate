class ChangeAddinfoInListings < ActiveRecord::Migration
  def change
	change_column :listings, :addinfo, :text, :limit => nil
  end
end
