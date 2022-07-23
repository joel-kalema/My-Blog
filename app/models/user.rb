class User < ApplicationRecord
  has_many :posts, class_name: 'post', foreign_key: 'author_id'
  has_many :comments, class_name: 'comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'like', foreign_key: 'author_id'

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
