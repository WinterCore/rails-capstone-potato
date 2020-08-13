require 'rails_helper'
require './spec/support/model_helpers'

RSpec.describe 'Sign Up', type: :feature do
  include ModelHelpers
  let(:user) { User.create user_data }

  scenario 'Sign Up' do
    visit new_user_path

    fill_in 'user[name]', with: 'bender'
    fill_in 'user[username]', with: 'bender'

    click_button 'Signup'

    expect(page).to have_current_path(root_path)
  end

  scenario 'User already exists' do
    visit new_user_path

    fill_in 'user[name]', with: user.name
    fill_in 'user[username]', with: user.username

    click_button 'Signup'

    expect(page).to have_content('Username has already been taken')
  end

  scenario 'Username can not be blank' do
    visit new_user_path

    fill_in 'user[name]', with: ''
    fill_in 'user[username]', with: ''

    click_button 'Signup'

    expect(page).to have_content("Name can't be blank")
  end
end

