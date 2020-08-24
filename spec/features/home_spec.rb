require 'rails_helper'
require 'database_cleaner/active_record'
require './spec/support/model_helpers'

RSpec.describe 'Render home page', type: :feature do
  include ModelHelpers
  let!(:user) { User.create user_data }
  let!(:category) { Category.create category_data }
  let!(:article1) { user.articles.create article_data.merge(category_ids: category.id) }
  let!(:article2) { user.articles.create article_data.merge(category_ids: category.id) }

  scenario 'Displays the most voted article in full width correctly' do
    article2.voters << user
    visit root_path
    expect(page).to have_content(article2.title)
  end

  scenario 'Displays categories with the title of the most recent article' do
    visit root_path
    expect(page).to have_content(category.name)
    expect(page).to have_content(article2.title)
  end
end
