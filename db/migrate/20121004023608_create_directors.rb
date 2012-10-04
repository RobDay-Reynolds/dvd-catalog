class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.date :date_of_birth
      t.string :gender

      t.timestamps
    end
  end
end
