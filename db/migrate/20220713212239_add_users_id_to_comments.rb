class AddUsersIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :users_id, :integer
    add_index :comments, :users_id
  end
end
