require_relative '../rails_helper'

RSpec.describe 'The signing in process', type: :feature do
  describe 'login page' do
    it 'displays email and password input field and submit button' do
      visit('/users/sign_in')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Log in')
    end

    describe 'after filling in input fields' do
      before :each do
        User.create!(name: 'test', email: 'test@testmail.com', password: '123456')
      end

      it 'signs me in successfully' do
        visit '/users/sign_in'
        fill_in 'Email', with: 'test@testmail.com'
        fill_in 'Password', with: '123456'
        click_on 'Log in'
        expect(current_path).to have_content('')
      end
    end
  end
end
