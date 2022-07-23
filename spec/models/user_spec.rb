require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'joel') }
  before { subject.save }
  context 'validation tests' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'posts_counts should be an integer' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end

  context 'model methods tests' do
    Post.destroy_all
    User.destroy_all
    user1 = User.new(name: 'taiwo', posts_counter: 0)
    user1.save
    Post.create(author: user1, title: 'what you doing', likes_counter: 0, comments_counter: 0)
    Post.create(author: user1, title: 'amazing post', likes_counter: 0, comments_counter: 0)
    Post.create(author: user1, title: 'Hahahaha', likes_counter: 0, comments_counter: 0)

    it 'method should get the most recent post of author' do
      recent_posts_arr = user1.most_recent_posts
      recent_posts = recent_posts_arr.map(&:title)
      expect(recent_posts).to eql ['Hahahaha', 'amazing post', 'what you doing']
    end
  end
end
