require 'rails_helper'

RSpec.describe "Creating post" do
  let(:user) { User.create(username: "exampleuser", email: "example@example.com", password: "password", password_confirmation: "password") }

  scenario "successfully" do
    sign_in user
    visit root_path
    click_on "Add a story"

    fill_in "Title", with: "First Post"
    fill_in "Body", with: "Awesome content"
    click_on "Publish"

    within(".posts") do
      expect(page).to have_content "First Post"
      expect(page).to have_content "exampleuser"
    end
  end

  scenario "unsuccessfully" do
    sign_in user
    visit root_path
    click_on "Add a story"

    fill_in "Title", with: "Second Post"
    fill_in "Body", with: ""
    click_on "Publish"

    expect(page).to have_css ".error"
  end

  scenario "non-logged-in user cannot create post" do
    visit root_path
    click_on "Add a story"

    expect(current_path).to eq(new_user_session_path)
  end
end
