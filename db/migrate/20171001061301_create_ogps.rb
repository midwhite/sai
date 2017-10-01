class CreateOgps < ActiveRecord::Migration[5.1]
  def change
    create_table :ogps do |t|
      t.integer :target_id
      t.string :target_type
      t.string :url
      t.string :image
      t.string :title
      t.string :description

      t.timestamps
    end
    add_index :ogps, [:target_type, :target_id]
  end
end
