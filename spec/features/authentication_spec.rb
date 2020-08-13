require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  let(:user) { User.create name: 'bender', username: 'bender' }

  scenario 'login' do
    visit new_session_path
    fill_in 'user[username]', with: user.username
    click_button 'Signin'
    expect(page).to have_content("Hey #{user.name}")
  end

  scenario 'logout', js: true do
    visit new_session_path
    fill_in 'user[username]', with: user.username
    click_button 'Signin'
    click_link 'Logout'
    expect(page).to have_content('LOGIN')
  end
end

