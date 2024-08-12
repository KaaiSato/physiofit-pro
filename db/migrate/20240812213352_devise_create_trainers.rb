# frozen_string_literal: true

class DeviseCreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :nickname, null: false
      t.string :email, null: false, unique: true
      t.string :encrypted_password, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_reading, null: false
      t.string :first_name_reading, null: false
      t.integer :age, null: false
      t.integer :sex_id, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.integer :registration_number, null: false
      t.text :career, null: false
      t.text :profile, null: false
      t.float :latitude
      t.float :longitude
      t.integer :service_radius_km

      t.timestamps
    end

    add_index :trainers, :email, unique: true
    # add_index :trainers, :reset_password_token, unique: true
    # add_index :trainers, :confirmation_token, unique: true
    # add_index :trainers, :unlock_token, unique: true
  end
end