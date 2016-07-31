require "rails_helper"

RSpec.describe User, :type => :model do
  it "require a first name" do
    carlos = User.new(first_name: nil, last_name: 'Orellana', email: 'c.orellana@gmail.com',
                      password: 'password')

    expect(carlos).not_to be_valid
    expect(carlos.errors[:first_name].any?).to be_truthy
  end

  it "require a last name" do
    carlos = User.new(first_name: 'Carlos', last_name: nil, email: 'c.orellana@gmail.com',
                      password: 'password')

    expect(carlos).not_to be_valid
    expect(carlos.errors[:last_name].any?).to be_truthy
  end

  it "require a email address" do
    carlos = User.new(first_name: 'Carlos', last_name: 'Orellana', email: nil,
                      password: 'password')

    expect(carlos).not_to be_valid
    expect(carlos.errors[:email].any?).to be_truthy
  end

  it "require password" do
    carlos = User.new(first_name: 'Carlos', last_name: 'Orellana', email: 'c.orellana@gmail.com',
                      password: nil)

    expect(carlos).not_to be_valid
    expect(carlos.errors[:password].any?).to be_truthy
  end

  describe "#full_name" do
    it "requires a #full_name" do
      carlos = User.create(first_name: 'Carlos', last_name: 'Orellana',
              email: 'c.orellana@gmail.com', password: 'password')

      expect(carlos.full_name).to eq('Carlos Orellana')
    end
  end

  it { should have_many (:addresses) }
  it { should accept_nested_attributes_for(:addresses) }

end
