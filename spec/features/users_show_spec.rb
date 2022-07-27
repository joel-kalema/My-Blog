require 'rails_helper'

RSpec.describe 'Test the User show page' do

  before :each do
    @user = User.create(name: 'Jake', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Algeria.',posts_counter:0)

  # add five posts for the user
    5.times do |i|
      Post.create(author: @user, title: "Post #{i}", text: 'This is my new post', comments_counter:0, likes_counter:0)
    end
    visit user_path(@user.id)
  end

  it 'displays users profile picture' do
    find('img[alt="Jake"]')
  end

  it 'displays the username' do
    expect(page).to have_content(@user.name)
  end

  it 'show number of posts written by the user' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it 'the users bio is visible' do
    expect(page).to have_content(@user.bio)
  end

  it 'button to view all posts is visible' do
    find_button('See all posts')
  end

  it 'the users bio is visible' do
    expect(page).to have_content(@user.bio)
  end

end