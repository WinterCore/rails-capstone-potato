require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:article) }
    it { should belong_to(:author).class_name(User.name) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end
