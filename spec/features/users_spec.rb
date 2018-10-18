require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    before(:each) do
      visit signup_path
      within('form') do
        fill_in 'Name',                   with: 'Thu'
        fill_in 'Password',               with: '123456'
        fill_in 'Password confirmation',  with: '123456'
      end
    end

    it "should be successful" do
      within('form') do
        fill_in 'Email', with: 'thu@example.com'
      end
      click_button 'Create my account'
      expect(page).to have_content 'Welcome to your page'
    end

    it "should fail" do
      click_button 'Create my account'
      expect(page).to have_content 'Email can\'t be blank'
    end
  end

  # context 'update user' do
  #   it "should be successful" do
  #     user = User.create( name:   'Thu',
  #                         email:  'thu@example.com',
  #                         password:               '123456',
  #                         password_confirmation:  '123456')
  #     visit edit_user_path(user)
  #     within('form') do
  #       fill_in 'Password',               with: 'password'
  #       fill_in 'Password confirmation',  with: 'password'
  #     end
  #     click_button 'Save changes'
  #     expect(page).to have_content 'Profile updated'
  #   end
  # end

  # context 'destroy user' do
  #   it "should be successful" do
  #     visit login_path
  #     within('form') do
  #       fill_in 'Email', with: 'example@email.com'
  #       fill_in 'Password', with: '123456'
  #     end
  #     click_button 'Log in'
  #     expect(page).to have_content('Sample User')
  #   end
  # end
end
