require "rails_helper"

RSpec.describe Author, :type => :model do
  it "requires the first name" do
    author = Fabricate.build(:author, first_name: nil)
    expect(author).not_to be_valid
    expect(author.errors[:first_name].any?).to be_truthy
  end

  it "requires the last name" do
    author = Fabricate.build(:author, last_name: nil)
    expect(author).not_to be_valid
    expect(author.errors[:last_name].any?).to be_truthy
  end

  describe "#full_name" do
    it "returns the full name of the author" do
      author = Fabricate(:author, first_name: "Carlos", last_name: "Orellana")
      expect(author.full_name).to eq("Carlos Orellana")
    end
  end
end
