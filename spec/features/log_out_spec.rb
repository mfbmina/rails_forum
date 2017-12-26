require 'rails_helper'

describe "the log out process", type: :feature do
  let(:user) { create(:user) }

  before { sign_in user }

  it "logs me out" do
    visit '/'
    click_on 'Logout'
    expect(page).to have_content 'Signed out successfully.'
  end
end
