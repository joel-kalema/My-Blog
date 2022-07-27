require 'rails_helper'

# Test the users index page using integration tests

RSpec.describe 'Users index page', type: :feature do
  before :each do
    @user = User.create(name: 'hiro', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                        posts_counter: 0)
    @user2 = User.create(name: 'grace', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                         posts_counter: 0)
  end
  it 'displays all users username' do
    visit '/users'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  it 'displays all users profile photo' do
    visit '/users'
    find('img[alt="hiro"]')
    find('img[alt="grace"]')
  end

  it 'displays number of posts' do
    visit '/users'
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 0')
  end

  it 'after clicking on a user, the user profile page is displayed' do
    visit '/users'
    first('.user_container > a').click
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  it 'displays all users profile photo' do
    visit '/users'
    find('img[alt="hiro"]')
    find('img[alt="grace"]')
  end
end
