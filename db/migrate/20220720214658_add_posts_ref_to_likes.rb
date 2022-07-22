# frozen_string_literal: true

class AddPostsRefToLikes < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_reference :likes, :post, null: false, foreign_key: true
  end
end
