require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(name: "Anything", email: "lorem@example.com",
            password: "foobar", password_confirmation: "foobar")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with too long name" do
    subject.name = "a" * 51
    expect(subject).to_not be_valid
  end

  it "is not valid with too long email" do
    subject.email = "a" * 251
    expect(subject).to_not be_valid
  end

  it "is valid with a valid email" do
    valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                      first.last@foo.jp alice_bob@foo.cn]
    valid_emails.each do |valid_email|
      subject.email = valid_email
      expect(subject).to be_valid, "#{valid_email.inspect} should be valid"
    end
  end

  it "is not valid with an invalid email" do
    invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                        foo@bar_baz.com foo@bar+baz.com]
    invalid_emails.each do |invalid_email|
      subject.email = invalid_email
      expect(subject).to_not be_valid, "#{invalid_email.inspect} should be invalid"
    end
  end

  it "is not valid without a unique email" do
    duplicate_user = subject.dup
    duplicate_user.email = subject.email.upcase
    subject.save
    expect(duplicate_user).to_not be_valid
  end

  it "is not valid with a too short password" do
    subject.password = subject.password_confirmation = "a" * 5
    expect(subject).to_not be_valid
  end
end
