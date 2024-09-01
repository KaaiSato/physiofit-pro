class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_reading, null: false
      t.string :first_name_reading, null: false
      t.date :date, null: false
      t.integer :time_id, null: false
      t.text :request, null: false
      t.references :trainer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
