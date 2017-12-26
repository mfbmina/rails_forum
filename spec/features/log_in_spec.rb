require 'rails_helper'

describe "the log in process", type: :feature do
  let!(:user) { create(:user, email: 'test@test.com', password: '123123') }

  context "with valid data" do
    it "logs me in" do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '123123'
      click_button 'Log in'
      expect(page).to have_content 'Logout'
      expect(page).to have_content 'Signed in successfully.'
    end
  end

  context "with invalid email" do
    it "logs me in" do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123123'
      click_button 'Log in'
      expect(page).to_not have_content 'Logout'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  context "with invalid email" do
    it "logs me in" do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '4123123'
      click_button 'Log in'
      expect(page).to_not have_content 'Logout'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end
