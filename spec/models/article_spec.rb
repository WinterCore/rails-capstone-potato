require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name(User.name) }
    it { should have_and_belong_to_many(:categories) }
    it { should have_many(:votes) }
    it { should have_many(:voters).through(:votes).source(:user) }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:category_ids) }
    it { should validate_length_of(:title).is_at_least(3).is_at_most(255) }
  end
end
