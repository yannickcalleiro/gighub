class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :time
      t.string :location
      t.string :artist

      t.timestamps null: false
    end
  end
end
