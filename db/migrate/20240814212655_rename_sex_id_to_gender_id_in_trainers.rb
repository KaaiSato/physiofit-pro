class RenameSexIdToGenderIdInTrainers < ActiveRecord::Migration[7.0]
  def change
    rename_column :trainers, :sex_id, :gender_id
  end
end
