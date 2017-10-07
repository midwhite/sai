class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id, null: false
      t.string :notification_type, null: false
      t.integer :target_id
      t.string :content
      t.boolean :opened, default: false

      t.timestamps
    end
    add_index :notifications, :user_id
  end
end
