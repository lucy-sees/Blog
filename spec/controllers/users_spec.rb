require_relative '../rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('List of users:')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create!(name: 'Tom', posts_counter: 0) }
    before(:example) { get user_path(user) }

    it 'returns http success status' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include(user.name)
    end
  end
end
