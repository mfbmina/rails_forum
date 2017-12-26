require 'rails_helper'

describe "deleting a topic", type: :feature, js: true do
  let(:user) { create(:user) }
  let(:topic) { create(:topic, user: user) }
  let!(:post) { create(:post, user: user, topic: topic) }

  before { sign_in user }

  it "deletes a post" do
    visit '/'
    click_on topic.subject
    page.accept_confirm do
      click_on 'delete_topic'
    end
    expect(page).to have_content 'Topic deleted successfully.'
  end
end
