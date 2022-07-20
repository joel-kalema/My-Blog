class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :update_post, ->(id, text) { find_by(id:).update(text:) }

  validates :likes_counter, :comments_counter, numericality: { only_integer: true, greater_or_equal_to: 0 }
  validates :title, presence: true, length: { maximum: 250 }

  def update_post_count
    new_count = author.posts.count
    author.update(posts_counter: new_count)
  end

  def most_recent_comments
    comments.order(created_at: :desc).first(5)
  end
end
  