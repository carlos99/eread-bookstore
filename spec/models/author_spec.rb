require "rails_helper"

RSpec.describe Author, :type => :model do
  it "requires the first name" do
    author = Fabricate.build(:author, first_name: nil)
    expect(author).not_to be_valid
    expect(author.errors[:first_name].any?).to be_true
  end

  it "requires the last name" do

  end

  describe "#full_name" do
    it "returns the full name of the author" do

    end
  end
end
