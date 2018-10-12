require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject {
    User.new(name: "Anything", email: "lorem@example.com",
            password: "foobar", password_confirmation: "foobar")
  }

  describe "GET #index" do
    it "should redirect index when not logged in" do
      get :index
      expect(redirect).to login_url
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "should redirect edit when not logged in" do
      get :edit
      expect(redirect).to login_url
    end
  end
end
