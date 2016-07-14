# require 'rails_helper'
#
# RSpec.feature "Creating Books" do
#   let!(:peachpit) { Fabricate(:publisher, name: 'peachpit Press') }
#   let!(:author1) { Fabricate(:author) }
#   let!(:author2) { Fabricate(:author) }
#
#   scenario "With valid input succeeds" do
#     visit root_path
#
#     click_link "Books", exact: false
#     click_link "Add New Book"
#
#     fill_in "Title", with: "Wings of Winter"
#     fill_in "Isbn", with: "9780321772978"
#     fill_in "Page count", with: 400
#     fill_in "Price", with: 35.99
#     fill_in "Description", with: "Learn Rails in the best way"
#     fill_in "Published_at", "2015-01-08"
#     select "peachpit Press", from: "Publisher"
#
#     click_buttom "Create Book"
#
#     expect(page).to have_content('Book has been createds')
#   end
# end
