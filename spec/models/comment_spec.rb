require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }

  describe '#update_comments_counter' do
    it 'updates the comments_counter after saving a comment' do
      comment = FactoryBot.build(:comment, user:, post:, text: 'This is a comment.')

      expect { comment.save }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
