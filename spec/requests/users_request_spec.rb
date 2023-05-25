require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'should succesfully request for users ' do
      get '/users/'
      expect(response.status).to eq(200)
    end
    it 'should succesfully render index template ' do
      get '/users/'
      expect(response.status).to render_template(:index)
    end
    it 'check the response body includes correct placeholder text' do
      get '/users/'
      expect(response.body).to include('<p class="text-end">Number of posts: 0</p>')
    end
  end
  describe 'GET /show' do
    user = User.create!(name: 'ambrose', photo: 'https://picsum.photos/200/300',
                        bio: 'some bio to pass validation', posts_counter: 0)
    it 'should succesfully render show template ' do
      get "/users/#{user.id}"
      expect(response.status).to render_template(:show)
    end
    it 'should succesfully request for users ' do
      get "/users/#{user.id}"
      expect(response.status).to eq(200)
    end
    it 'check the response body includes correct placeholder text' do
      get "/users/#{user.id}"
      expect(response.body).to include('<p class="text-end">Number of posts: 0</p>')
    end
  end
end
