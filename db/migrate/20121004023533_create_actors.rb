class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name, :null => false, :uniqueness => true
      t.date :date_of_birth
      t.string :gender, :null => false

      t.timestamps
    end
  end
end
