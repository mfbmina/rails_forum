require 'rails_helper'

describe "the sign up process", type: :feature do
  it "signs me in" do
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'
    click_button 'Sign up'
    expect(page).to have_content 'Logout'
  end

  context "with invalid email" do
    it "not sign up me in" do
      visit '/'
      click_on 'Sign up'
      fill_in 'Username', with: 'test'
      fill_in 'Password', with: '123123'
      fill_in 'Password confirmation', with: '123123'
      click_button 'Sign up'
      expect(page).to_not have_content 'Logout'
      expect(page).to have_content '1 error prohibited this user from being saved'
    end
  end

  context "with invalid username" do
    it "not sign up me in" do
      visit '/'
      click_on 'Sign up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '123123'
      fill_in 'Password confirmation', with: '123123'
      click_button 'Sign up'
      expect(page).to_not have_content 'Logout'
      expect(page).to have_content '1 error prohibited this user from being saved'
    end
  end

  context "with password different to password confirmation" do
    it "not sign up me in" do
      visit '/'
      click_on 'Sign up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Username', with: 'test'
      fill_in 'Password', with: '123123'
      fill_in 'Password confirmation', with: '1231239'
      click_button 'Sign up'
      expect(page).to_not have_content 'Logout'
      expect(page).to have_content '1 error prohibited this user from being saved'
    end
  end
end
