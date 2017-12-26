require 'rails_helper'

describe "editing a topic", type: :feature do
  let(:user) { create(:user) }
  let(:topic) { create(:topic, user: user) }
  let!(:post) { create(:post, user: user, topic: topic) }

  before { sign_in user }

  context 'with valid data' do
    it "updates a post" do
      visit '/'
      click_on topic.subject
      click_on 'edit_topic'
      fill_in 'Subject', with: 'My topic 2'
      fill_in 'Content', with: 'My cool post 2'
      click_button 'Save'
      expect(page).to have_content 'My topic 2'
      expect(page).to have_content 'My cool post 2'
      expect(page).to have_content 'Topic updated successfully.'
    end
  end

  context 'with invalid subject' do
    it "not update a post" do
      visit '/'
      click_on topic.subject
      click_on 'edit_topic'
      fill_in 'Subject', with: ''
      click_button 'Save'
      expect(page).to have_content 'Error updating this topic.'
    end
  end

  context 'with invalid content' do
    it "not update post" do
      visit '/'
      click_on topic.subject
      click_on 'edit_topic'
      fill_in 'Content', with: ''
      click_button 'Save'
      expect(page).to have_content 'Error updating this topic.'
    end
  end
end
