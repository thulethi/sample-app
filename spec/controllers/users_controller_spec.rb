require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # subject {
  #   User.new(name: "Anything", email: "lorem@example.com",
  #           password: "foobar", password_confirmation: "foobar")
  # }

  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to redirect_to(login_url)
    end
  end

  context 'GET #new' do
    it 'returns a success reponse' do
      get :new
      expect(response).to be_success
    end
  end

  # context 'GET #edit' do
  #   it 'redirects when not logged in' do
  #     get :edit
  #     expect(response).to redirect_to(login_url)
  #   end
  # end

  context 'GET #show' do
    it 'returns a success response' do
      user = User.create!(name: 'Thu',
                          email: 'thu@example.com',
                          password: '123456',
                          password_confirmation: '123456')
      get :show, params: { id: user.to_param }
      expect(response).to be_success
    end
  end
end
