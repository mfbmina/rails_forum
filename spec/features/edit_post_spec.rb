require 'rails_helper'

describe "editing a post", type: :feature do
  let(:user) { create(:user) }
    let!(:post) { create(:post, user: user) }

  before { sign_in user }

  context 'with valid content' do
    it "creates a new post" do
      visit '/'
      click_on post.topic.subject
      click_on 'edit_post'
      fill_in 'Content', with: 'My cool post 2'
      click_button 'Edit'
      expect(page).to have_content 'My cool post 2'
      expect(page).to have_content 'Post updated successfully.'
    end
  end

  context 'with invalid content' do
    it "not create a post" do
      visit '/'
      click_on post.topic.subject
      click_on 'edit_post'
      fill_in 'Content', with: ''
      click_button 'Edit'
      expect(page).to have_content 'Error updating this post.'
    end
  end
end
