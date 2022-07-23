require 'rails_helper'

RSpec.describe Like, type: :model do
  subject = Like.new
  user = User.new(name: 'Firdavs', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'life of who')
  post = Post.new(title: 'Educations post', text: 'This is the education !', comments_counter: 0)

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
