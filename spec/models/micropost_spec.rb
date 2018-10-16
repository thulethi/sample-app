require 'rails_helper'

RSpec.describe Micropost, type: :model do

  let(user) {User.new(name: "Example", email: "example@email.com")}
  subject {
    user.microposts.build(content: "Anything")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with content longer than 140 characters" do
    subject.content = "a" * 141
    expect(subject).to_not be_valid
  end

  # it "is valid with most recent order" do
  #   expect(subject(:most_recent)).to eq(Micropost.first)
  # end
end

# RSpec.describe "Associations" do
#   it {should belong_to(:user)}
# end
