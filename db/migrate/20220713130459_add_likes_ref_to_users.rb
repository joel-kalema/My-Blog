class AddLikesRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :likes, null: false, foreign_key: true
  end
end
