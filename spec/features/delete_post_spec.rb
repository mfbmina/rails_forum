require 'rails_helper'

describe "deleting a post", type: :feature, js: true do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  before { sign_in user }

  it "deletes a post" do
    visit '/'
    click_on post.topic.subject
    page.accept_confirm do
      click_on 'delete_post'
    end
    expect(page).to have_content 'Post deleted successfully.'
  end
end
