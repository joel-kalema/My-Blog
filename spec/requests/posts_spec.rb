require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/posts' do
    before(:each) { get user_posts_path(1) }
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should right placeholder in respons body' do
      expect(response.body).to include('This is my first post')
    end
  end

  describe 'GET Posts/show' do
    it 'render show template' do
      id = 1
      get "/users/1/posts/#{id}"
      expect(response).to render_template(:show)
      expect(response.body).to include('This is my first post')
    end
  end
end
