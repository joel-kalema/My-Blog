class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def update_like_count
    new_count = post.likes.count
    post.update(likes_counter: new_count)
  end
end