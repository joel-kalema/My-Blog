# frozen_string_literal: true

class AddUsersRefToComments < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_reference :comments, :author, null: false, foreign_key: { to_table: :users }
  end
end
