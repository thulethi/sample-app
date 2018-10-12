require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signups" do
    it "should render signup page for invalid info" do
      get signup_path
      before_count = User.count
      post @users_path, @user: {name: "",
                              email: "user@sd",
                              password:              "123",
                              password_confirmation: "123"}
      expect(response).to render_template('users/new')
      after_count = User.count
      expect(before_count).to
    end
  end
end
