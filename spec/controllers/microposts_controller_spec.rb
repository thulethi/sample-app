require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do
  context 'GET #create' do
    it 'redirects create when not logged in' do
      post :create
      expect(response).to redirect_to(login_url)
    end
  end

  context 'GET #destroy' do
    it 'redirects destroy when not logged in' do
      post :destroy
      expect(response).to eq(Micropost.count)
      expect(response).to redirect_to(login_url)
    end
  end
end
