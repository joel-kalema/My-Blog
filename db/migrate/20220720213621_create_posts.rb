# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
