require 'rails_helper'

RSpec.describe 'Test the Post show page' do
  before :each do
    @user = User.create(name: 'Joe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',posts_counter:0)
    @user2 = User.create(name: 'Bella', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',posts_counter:0)

    # add posts for the user
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', comments_counter:0, likes_counter:0)
    Comment.create(post: @post, author: @user2, text: 'Hi Lilly!')
    Comment.create(post: @post, author: @user2, text: 'Hi Lilly!')

    visit user_post_path(@post.author, @post)
  end

  it "I can see the post's title" do
    expect(page).to have_content(@post.title)
  end

  it 'I can see the post body' do
    expect(page).to have_content(@post.text)
  end

  it 'I can see the username of each commentor' do
    expect(page).to have_content(@user2.name)
  end

  it 'I can see the comment each commentor left' do
    expect(page).to have_content('Hi Lilly!')
  end
end
