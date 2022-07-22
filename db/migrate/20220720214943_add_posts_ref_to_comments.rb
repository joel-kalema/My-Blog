# frozen_string_literal: true

class AddPostsRefToComments < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_reference :comments, :post, null: false, foreign_key: true
  end
end
