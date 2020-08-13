require 'rails_helper'
require './spec/support/model_helpers'
require './spec/support/authentication_helpers'

RSpec.describe 'Show article', type: :feature do
  include ModelHelpers
  include AuthenticationHelpers
  let!(:user) { User.create user_data }
  let!(:commenter) { User.create user_data }
  let!(:category) { Category.create category_data }
  let!(:article1) { user.articles.create article_data.merge(category_ids: [category.id]) }
  let!(:comment) { article1.comments.create comment_data.merge(author_id: user.id) }

  scenario 'Shows article data' do
    visit article_path(article1)

    expect(page).to have_content(article1.title)
    expect(page).to have_content(article1.text)
    expect(page).to have_content(article1.author.name)
  end

  scenario 'Shows all article comments' do
    visit article_path(article1)

    expect(page).to have_content(comment.author.name)
    expect(page).to have_content(comment.content)
  end

  scenario 'Does not allow unauthenticated users to comment' do
    visit article_path(article1)

    click_button 'Comment'
    expect(page).to have_current_path(new_session_path)
  end

  scenario 'Allows logged in users to comment and stores comments successfully' do
    login_user
    visit article_path(article1)

    new_comment = comment_data
    fill_in 'comment[content]', with: new_comment[:content]
    click_button 'Comment'
    expect(page).to have_current_path(article_path(article1))
    expect(page).to have_content(new_comment[:content])
  end
end
