require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:articles).with_foreign_key(:author_id) }
    it { should have_many(:votes) }
    it { should have_many(:voted_articles).through(:votes).source(:article) }
    it { should have_many(:comments).with_foreign_key(:author_id) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(255) }
    it { should validate_length_of(:username).is_at_least(3).is_at_most(255) }
  end
end
