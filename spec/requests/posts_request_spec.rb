require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'should succesfully request for posts ' do
      get '/users/13/posts'
      expect(response.status).to eq(200)
    end
    it 'should succesfully render index template ' do
      get '/users/13/posts'
      expect(response.status).to render_template(:index)
    end
    it 'check the response body includes correct placeholder text' do
      get '/users/13/posts'
      expect(response.body).to include('<h1>this is the place holder for posts</h1>')
    end
  end
  describe 'GET /show' do
    it 'should succesfully render show template ' do
      get '/users/13/posts/1'
      expect(response.status).to render_template(:show)
    end
    it 'should succesfully request for posts ' do
      get '/users/13/posts/1'
      expect(response.status).to eq(200)
    end

    it 'check the response body includes correct placeholder text' do
      get '/users/13/posts/1'
      expect(response.body).to include('<h1>placeholder for show template</h1>')
    end
  end
end
