require 'rails_helper'

RSpec.describe Relationship, type: :model do
  context "validation tests" do

    subject {
      Relationship.new(follower_id: 1, followed_id: 2)
    }

    it "ensures follower_id presence" do
      subject.follower_id = nil
      expect(subject).to_not be_valid
    end

    it "ensures followed_id presence" do
      subject.followed_id = nil
      expect(subject).to_not be_valid
    end

    it "should save successfully" do
      expect(subject).to be_valid
    end

  end
end
