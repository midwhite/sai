class AddPhotoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo, :string
    add_column :users, :policy_field, :string
    add_column :users, :team_id, :integer
    remove_column :users, :support_for, :integer
    remove_column :users, :support_type, :integer

    remove_column :users, :registered_at, :date
    add_column :users, :registered_at, :datetime
    remove_column :users, :district, :string
    add_column :users, :district, :integer

    add_column :users, :university, :string
    add_column :users, :major, :integer
    add_column :users, :url, :string

    remove_column :topics, :policy, :integer
    add_column :topics, :policy, :string
  end
end
