module AuthenticationHelpers
  def login_user
    visit new_session_path
    fill_in 'user[username]', with: user.username
    click_button 'Signin'
  end
end
