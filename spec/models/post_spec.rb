require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Wahala', text: 'one challenge at a time') }

  before { subject.save }

  it 'name should not be empty' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.title = [1..300]
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be greater than or equal to zero.' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be greater than or equal to zero.' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
end