class AddIndexToSitesUrl < ActiveRecord::Migration[5.1]
  def change
    add_index :sites, :url, unique: true
  end
end
