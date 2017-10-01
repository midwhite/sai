class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :topic_id
      t.integer :user_id
      t.integer :reply_to
      t.text :content
      t.integer :position

      t.timestamps
    end
    add_index :comments, :topic_id
    add_index :comments, :reply_to
  end
end
