class CreateActorsDvds < ActiveRecord::Migration
  def change
    create_table :actors_dvds, :id => false do |t|
      t.integer :dvd_id
      t.integer :actor_id
    end
  end
end
