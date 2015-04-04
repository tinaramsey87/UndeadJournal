require 'rails_helper'

describe 'the sign up a user process' do
  it 'adds a new user' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Username', with: "Test"
    fill_in 'Phone', with: "5031234567"
    fill_in 'Password', with: "1234"
    fill_in 'Password confirmation', with: "1234"
    click_on 'Create Account'
    expect(page).to have_content 'successfully'
  end
end

describe 'the log in a user process' do
  it 'logs a user in' do
    FactoryGirl.create(:user)
    visit root_path
    click_on "Log In"
    fill_in "Username", with: "FactoryGirl"
    fill_in "Password", with: "1234"
    click_on "Log in"
    expect(page).to have_content 'successfully'
  end
end
