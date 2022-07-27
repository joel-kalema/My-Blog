require 'rails_helper'

RSpec.describe 'Test the User show page' do
  before :each do
    @user = User.create(name: 'Jake', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Algeria.',
                        posts_counter: 0)

    # add five posts for the user
    5.times do |i|
      Post.create(author: @user, title: "Post #{i}", text: 'This is my new post', comments_counter: 0, likes_counter: 0)
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

  it 'show number of posts written by the user' do
    expect(page).to have_content('Number of posts: 5')
  end

  it 'the users bio is visible' do
    expect(page).to have_content(@user.bio)
  end

  it 'button to view all posts is visible' do
    find_button('See all posts')
    expect(page).to have_content('See all posts')
  end

  it 'go to post#show page when a user click to view post' do
    expect(page).to have_content('This is my new post')
    expect(page).to have_content('likes: 0')
    expect(page).to have_content('comment: 0')
  end

  it 'the users bio is visible' do
    expect(page).to have_content(@user.bio)
  end
<<<<<<< HEAD
=======

  it 'go to the users post#index page when a user click on view all post' do
    click_button('See all posts')
    expect(page).to have_content(@user.bio)
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end
>>>>>>> 257baf344b7bb060fecd7f70bcfa6f5ee5aff617
end
