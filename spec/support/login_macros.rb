module LoginMacros
  def login(user)
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: 'secure_password'
    click_button 'ログイン'
  end
end
