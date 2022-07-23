require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject = Comment.new(text: 'Method is being tested')
  user = User.new(name: 'Firdavs', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Weirdo')
  post = Post.new(title: 'New post came', text: 'Hey buddy are you good!', comments_counter: 0)

  before { subject.save }
  before { post.save }
  before { user.save }

  it 'author should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'author should be correct person' do
    subject.author_id = user.id
    expect(subject).to be_truthy
  end
end
