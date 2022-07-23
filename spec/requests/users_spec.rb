require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: '', photo: 'https://avatars.githubusercontent.com/u/57408419?v=4', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be empty' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be greater than or equal to zero.' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end