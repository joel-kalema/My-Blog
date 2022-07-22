# frozen_string_literal: true

class AddUsersRefToPosts < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_reference :posts, :author, null: false, foreign_key: { to_table: :users }
  end
end
