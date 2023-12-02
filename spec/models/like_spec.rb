require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }

  describe '#update_likes_counter' do
    it 'updates the likes_counter after saving a like' do
      FactoryBot.create(:like, user:, post:)

      expect(post.reload.likes_counter).to eq(1)
    end
  end
end
