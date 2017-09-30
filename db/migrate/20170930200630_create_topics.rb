class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.integer :target_id
      t.string :target_type
      t.integer :policy
      t.integer :position

      t.timestamps
    end
    add_index :topics, :policy
  end
end
