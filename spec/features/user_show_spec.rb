require 'rails_helper'

# Test the users index page using integration tests

RSpec.describe 'Users index page', type: :feature do
  before :each do
    @user = User.create(name: 'Damola', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @user2 = User.create(name: 'Joel kalema', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Poland.')
  end
  it 'displays all users username' do
    visit '/'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  it 'displays all users profile photo' do
    visit '/'
    find('img[alt="Damola"]')
    find('img[alt="Joel kalema"]')
  end

  it 'displays number of posts' do
    visit '/'
    expect(page).to have_content('Number of posts: 0')
  end

  it 'after clicking on a user, the user profile page is displayed' do
    visit '/'
    click_link @user.name
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end
end
