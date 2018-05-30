class AddShortUrlColumnToSites < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :short_url, :string
  end
end
