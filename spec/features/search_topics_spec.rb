require 'rails_helper'

describe "searching for a topic", type: :feature do
  let(:topic_1) { create(:topic, subject: 'My topic 1') }
  let(:topic_2) { create(:topic, subject: 'My topic 2') }

  before { [topic_1, topic_2].each { |topic| create(:post, topic: topic) } }

  context 'with an empty search' do
    it "finds all topics" do
      visit '/'
      click_on 'Search'
      expect(page).to have_content 'My topic 1'
      expect(page).to have_content 'My topic 2'
    end
  end

  context 'with a common term' do
    it "find all common topics" do
      visit '/'
      fill_in 'search_topic', with: 'my'
      click_on 'Search'
      expect(page).to have_content 'My topic 1'
      expect(page).to have_content 'My topic 2'
    end
  end

  context 'with a specific term' do
    it "find just one topic" do
      visit '/'
      fill_in 'search_topic', with: '1'
      click_on 'Search'
      expect(page).to have_content 'My topic 1'
      expect(page).to_not have_content 'My topic 2'
    end

    it "find just one topic" do
      visit '/'
      fill_in 'search_topic', with: '2'
      click_on 'Search'
      expect(page).to_not have_content 'My topic 1'
      expect(page).to have_content 'My topic 2'
    end
  end
end
