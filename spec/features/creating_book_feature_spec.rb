require 'rails_helper'

Rspec.feature "Creating Books" do
  let!(:peachpit) { Fabricate(:publisher, name: 'peachpit Press') }
  let!(:author1) { Fabricate(:author) }
  let!(:author2) { Fabricate(:author) }

  scenario "With valid input succeeds" do
    visit root_path

    click_link "Books", exact: false
    click_link "Add New Book"

    fill_in "Title", with: "Wings of Winter"
  end
end
