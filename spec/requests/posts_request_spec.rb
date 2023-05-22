require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    user = User.create!(name: 'some name', photo: 'https://picsum.photos/200/300', bio: 'some  bio for validation',
                        posts_counter: 0)

    it 'should succesfully request for posts ' do
      get "/users/#{user.id}/posts"
      expect(response.status).to eq(200)
    end
    it 'should succesfully render index template ' do
      get "/users/#{user.id}/posts"
      expect(response.status).to render_template(:index)
    end
    it 'check the response body includes correct placeholder text' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('<h1>this is the place holder for posts</h1>')
    end
  end
  describe 'GET /show' do
    user = User.create!(name: 'some name', photo: 'https://picsum.photos/200/300', bio: 'some  bio for validation',
                        posts_counter: 0)
    post = Post.create(title: 'title', text: ' Post text 1', comments_counter: 0, likes_counter: 0)
    user.posts << post
    it 'should succesfully render show template ' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.status).to render_template(:show)
    end
    it 'should succesfully request for posts ' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.status).to eq(200)
    end

    it 'check the response body includes correct placeholder text' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('<h1>placeholder for show template</h1>')
    end
  end
end
