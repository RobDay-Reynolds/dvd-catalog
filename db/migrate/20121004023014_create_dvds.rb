class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.string :name, :null => false
      t.date :release_date
      t.text :summary, :null => false
      t.string :amazon_id
      t.integer :director_id

      t.timestamps
    end
  end
end
