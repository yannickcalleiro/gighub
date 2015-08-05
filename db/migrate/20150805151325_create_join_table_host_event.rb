class CreateJoinTableHostEvent < ActiveRecord::Migration
  def change
      create_join_table :hosts, :events do |t|
	      t.index [:host_id, :event_id]
	      t.index [:event_id, :host_id]

	      t.index :event_id, unique: true
	  end
  end
end
