require 'rails_helper'
require './spec/support/model_helpers'
require './spec/support/authentication_helpers'

RSpec.describe 'Articles page', type: :feature do
  include ModelHelpers
  include AuthenticationHelpers

  let(:user) { User.create user_data }
  let(:category1) { Category.create category_data }
  let(:category2) { Category.create category_data }
  let!(:article1) { user.articles.create article_data.merge(category_ids: [category1.id]) }
  let!(:article2) { user.articles.create article_data.merge(category_ids: [category2.id]) }

  scenario 'Filters articles by category' do
    visit articles_path(category: category1.id)
    expect(page).to have_content(article1.title)
    expect(page).not_to have_content(article2.title)
  end

  scenario 'Shows all articles if no category is provided' do
    visit articles_path
    expect(page).to have_content(article1.title)
    expect(page).to have_content(article2.title)
  end

  scenario 'Show the correct number of votes for each article' do
    article2.voters << user
    visit articles_path

    expect(page).to have_content(article2.votes.count)
    expect(page).to have_content(article1.votes.count)
  end

  scenario 'Not allow unauthenticated users to vote' do
    visit articles_path

    page.find("a[href=\"#{article_votes_path(article1.id)}\"]").click

    expect(page).to have_current_path(new_session_path)
  end

  scenario 'Allow logged in users to vote for articles' do
    login_user
    visit articles_path
    page.find("a[href=\"#{article_votes_path(article1.id)}\"]").click
    article1.reload
    expect(article1.votes.count).to eq(1)
    expect(page).to have_content(article1.votes.count)
  end

  scenario 'Not allow users to vote for the same article more than once' do
    login_user
    visit articles_path
    page.find("a[href=\"#{article_votes_path(article1.id)}\"]").click
    page.find("a[href=\"#{article_votes_path(article1.id)}\"]").click

    article1.reload
    expect(article1.votes.count).to eq(1)
    expect(page).to have_content(article1.votes.count)
  end
end
