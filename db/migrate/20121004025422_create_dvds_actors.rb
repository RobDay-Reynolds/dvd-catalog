class CreateDvdsActors < ActiveRecord::Migration
  def change
    create_table :dvds_actors do |t|
      t.integer :dvd_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
