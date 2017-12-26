require 'rails_helper'

describe "creating a post", type: :feature do
  let(:user) { create(:user) }
    let!(:post) { create(:post, user: user) }

  before { sign_in user }

  context 'with valid data' do
    it "creates a new post" do
      visit '/'
      click_on post.topic.subject
      fill_in 'Content', with: 'My cool post'
      click_button 'Post'
      expect(page).to have_content 'My cool post'
      expect(page).to have_content 'Topic replied successfully.'
    end
  end

  context 'with invalid content' do
    it "not create a post" do
      visit '/'
      click_on post.topic.subject
      click_button 'Post'
      expect(page).to have_content 'Error replying this topic.'
    end
  end
end
