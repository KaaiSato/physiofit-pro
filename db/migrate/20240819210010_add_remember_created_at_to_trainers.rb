class AddRememberCreatedAtToTrainers < ActiveRecord::Migration[7.0]
  def change
    add_column :trainers, :remember_created_at, :datetime
  end
end
