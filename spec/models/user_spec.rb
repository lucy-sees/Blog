require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  describe 'validations' do
    subject { User.new(name: 'Faker', posts_counter: 0) }

    before { subject.save }

    it 'includes name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should allow valid values for posts_counter' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#return_recent_posts' do
    it 'returns the most recent posts' do
      older_post = FactoryBot.create(:post, author: user, created_at: 2.days.ago)
      recent_post1 = FactoryBot.create(:post, author: user, created_at: 1.day.ago)
      recent_post2 = FactoryBot.create(:post, author: user, created_at: 1.hour.ago)

      recent_posts = user.return_recent_posts

      expect(recent_posts.sort_by(&:created_at)).to eq([older_post, recent_post1, recent_post2])
    end

    it 'returns up to 3 recent posts' do
      FactoryBot.create_list(:post, 5, author: user)

      recent_posts = user.return_recent_posts

      expect(recent_posts.count).to eq(3)
    end
  end
end
