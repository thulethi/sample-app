require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    # let (:params) { {name: "Thu", email: "thu@example.com", password: "foobar", password_confirmation: "foobar"} }

    it "ensures name presence" do
      user = User.new(email: "thu@example.com").save
      expect(user).to eq(false)
    end

    it "ensures email presence" do
      user = User.new(name: 'Thu').save
      expect(user).to eq(false)
    end

    it "should save successfully" do
      user = User.new(name: "Thu",
                      email: "thu@example.com",
                      password: "foobar",
                      password_confirmation: "foobar").save
      expect(user).to eq(true)
    end

    it "ensures not too long name" do
      user = User.new(name: "a" * 51,
                      email: "thu@example.com",
                      password: "foobar",
                      password_confirmation: "foobar").save
      expect(user).to eq(false)
    end

    it "ensures with too long email" do
      user = User.new(name: "Thu",
                      email: "a" * 251,
                      password: "foobar",
                      password_confirmation: "foobar").save
      expect(user).to eq(false)
    end

    it "ensures a valid email" do
      valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice_bob@foo.cn]
      valid_emails.each do |valid_email|
        user = User.new(name: "Thu",
                        email: valid_email,
                        password: "foobar",
                        password_confirmation: "foobar").save
        expect(user).to eq(true), "#{valid_email.inspect} should be valid"
      end
    end

    it "does not ensure an invalid email" do
      invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
      invalid_emails.each do |invalid_email|
        user = User.new(name: "Thu",
                        email: invalid_email,
                        password: "foobar",
                        password_confirmation: "foobar").save
        expect(user).to eq(false), "#{invalid_email.inspect} should be invalid"
      end
    end

    # it "ensures a unique email" do
    #   user = User.new(name: "Thu",
    #                   email: "thu@example.com",
    #                   password: "foobar",
    #                   password_confirmation: "foobar").save
    #   duplicate_user = user.dup
    #   duplicate_user.email = user.email.upcase
    #   duplicate_user.save
    #   expect(duplicate_user).to eq(false)
    # end

    it "ensures not too short password" do
      user = User.new(name: "Thu",
                      email: "thu@example.com",
                      password: "a" * 5,
                      password_confirmation: "a" * 5).save
      expect(user).to eq(false)
    end
  end

  # context 'scope tests' do
  #   let (:params) { {name: "Thu", email: "thu@example.com", password: "foobar", password_confirmation: "foobar"} }
  #   before(:each) do
  #     User.new(params).save
  #     User.new(params).save
  #     User.new(params).save
  #     User.new(params.merge(active: false)).save
  #     User.new(params.merge(active: false)).save
  #   end

  #   it "returns active users" do
  #     expect(User.active_users.size).to eq(3)
  #   end

  #   it "returns inactive users" do
  #     expect(User.inactive_users.size).to eq(2)
  #   end
  # end

  # subject {
  #   User.new(name: "Anything", email: "lorem@example.com",
  #           password: "foobar", password_confirmation: "foobar")
  # }


end
