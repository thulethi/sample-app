require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do

    subject {
      User.new( name: "Thu",
                email: "thu@example.com",
                password: "foobar",
                password_confirmation: "foobar")
    }

    it "ensures name presence" do
      subject.name = " "
      expect(subject).to_not be_valid
    end

    it "ensures email presence" do
      subject.email = " "
      expect(subject).to_not be_valid
    end

    it "should save successfully" do
      expect(subject).to be_valid
    end

    it "ensures not too long name" do
      subject.name = "a" * 51
      expect(subject).to_not be_valid
    end

    it "ensures with too long email" do
      subject.email = "a" * 251
      expect(subject).to_not be_valid
    end

    it "ensures a valid email" do
      valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice_bob@foo.cn]
      valid_emails.each do |valid_email|
        subject.email = valid_email
        expect(subject).to be_valid, "#{valid_email.inspect} should be valid"
      end
    end

    it "does not ensure an invalid email" do
      invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
      invalid_emails.each do |invalid_email|
        subject.email = invalid_email
        expect(subject).to_not be_valid, "#{invalid_email.inspect} should be invalid"
      end
    end

    it "ensures a unique email" do
      duplicate_user = subject.dup
      subject.save
      expect(duplicate_user).to_not be_valid
    end

    it "ensures not too short password" do
      subject.password = "a" * 5
      expect(subject).to_not be_valid
    end
  end

  context 'following tests' do
    let(@user) {User.new(name:                  "Adas",
                        email:                  "adas@email.com",
                        password:               "123456",
                        password_confirmation:  "123456")}

    it "should follow and unfollow a user" do
      expect(subject.following?(@user)).to_not be_true
      subject.follow(@user)
      expect(subject.following?(@user)).to be_true
      expect(@user.followers.includes(subject)).to be_true
      subject.unfollow(@user)
      expect(subject.following?(@user)).to_not be_true
    end
  end

end
