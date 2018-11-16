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
      fill_in 'Username', with: 'jon'
      fill_in 'Password', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content('jon')
      user = User.find_by(username: 'jon')
      expect(current_path).to eq(user_path(user))
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
