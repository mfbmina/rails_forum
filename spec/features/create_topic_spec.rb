require 'rails_helper'

describe "creating a topic", type: :feature do
  let(:user) { create(:user) }

  before { sign_in user }

  context 'with valid data' do
    it "creates a new post" do
      visit '/'
      click_on 'New'
      fill_in 'Subject', with: 'My topic'
      fill_in 'Content', with: 'My cool post'
      click_button 'Save'
      expect(page).to have_content 'My topic'
      expect(page).to have_content 'My cool post'
      expect(page).to have_content 'Topic created successfully.'
    end
  end

  context 'with invalid subject' do
    it "not create a post" do
      visit '/'
      click_on 'New'
      fill_in 'Content', with: 'My cool post'
      click_button 'Save'
      expect(page).to have_content 'Error creating a topic.'
    end
  end

  context 'with invalid content' do
    it "not create a post" do
      visit '/'
      click_on 'New'
      fill_in 'Subject', with: 'My topic'
      click_button 'Save'
      expect(page).to have_content 'Error creating a topic.'
    end
  end
end
