# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :likes, &:timestamps
  end
end
