class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.string :sender_type, null: false
      t.integer :sender_id, null: false
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
