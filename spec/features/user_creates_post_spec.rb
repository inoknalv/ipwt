require 'rails_helper'

RSpec.describe "Creating post" do
  scenario "successfully" do
    visit root_path
    click_on "Add a story"

    fill_in "Title", with: "First Post"
    fill_in "Body", with: "Awesome content"
    click_on "Publish"

    expect(page).to have_content "First Post"
  end

  scenario "unsuccessfully" do
    visit root_path
    click_on "Add a story"

    fill_in "Title", with: "Second Post"
    fill_in "Body", with: ""
    click_on "Publish"

    expect(page).to have_css ".error"
  end
end
