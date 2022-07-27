require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Alfred', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'This is my life bio') }

  before { subject.save }

  it 'name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Lenth should be three' do
    posts = User.three_most_recent_posts(User.first.id)
    expect(posts.length).to eq(3)
  end

  it 'PostsCounter must be greater than or equal to zero.' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
