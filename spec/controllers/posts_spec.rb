require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create!(name: 'Tom', posts_counter: 0) }
  let(:post) do
    Post.create!(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0, author: user)
  end

  describe 'GET #index' do
    before(:example) { get :index, params: { user_id: user.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'assigns @posts' do
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET #show' do
    let(:user) { User.create!(name: 'Tom', posts_counter: 0) }
    let(:post) do
      Post.create!(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0, author: user)
    end

    before(:example) { get :show, params: { user_id: user.id, id: post.id } }

    it 'returns http success status' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end
end
