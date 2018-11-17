require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do
    visit(new_user_path)
  end

  scenario 'has a new user page' do
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    expect(page).to have_content('Sign up')
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      fill_in 'Username', with: 'savio'
      fill_in 'Password', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content('savio')

      user = User.find_by(username: 'savio')
      expect(current_path).to eq(user_path(user))
    end
  end
end

feature 'logging in' do
  let!(:user) {User.create!(username:'Jon', password: 'password')}
  background :each do
    visit(new_session_path)

  end

  feature 'logging in a user' do
    scenario 'shows username on the homepage after login' do
      fill_in 'Username', with: 'Jon'
      fill_in 'Password', with: 'password'
      click_button 'Login'

      expect(page).to have_content('Jon')
    end
  end



  feature 'logging out' do
    scenario 'begins with a logged out state' do
      expect(page).to have_content('Username')
      expect(page).to have_content('Password')
      expect(page).to have_content('Login')
    end

    scenario 'doesn\'t show username on the homepage after logout' do
      fill_in 'Username', with: 'Jon'
      fill_in 'Password', with: 'password'
      click_button 'Login'
      expect(page).to have_content('Jon')
      click_button 'Logout'
      expect(page).not_to have_content('Jon')


    end

  end
end
