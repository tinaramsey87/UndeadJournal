def sign_in(user)
  visit root_path
  click_on 'Log In'
  fill_in 'Username', with: 'Test'
  fill_in 'Password', with: "1234"
  click_on 'Log in'
end
