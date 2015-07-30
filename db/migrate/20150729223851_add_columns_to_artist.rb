class AddColumnsToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :role, :string
    add_column :artists, :about, :string
    add_column :artists, :price, :integer
    add_column :artists, :hour, :integer
    add_column :artists, :soundcloud_address, :string
    add_column :artists, :youtube_address, :string
  end
end
