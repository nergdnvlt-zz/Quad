require 'rails_helper'

describe 'an existing user can login' do
  describe 'when they enter their username' do
    it 'at /welcome' do
      visit '/'

      click_on 'Login'
      fill_in 'Username', with: 'fatherWar'
      fill_in 'Phone Number', with: '+17196639883'
      click_on 'Login'

      expect(current_path).to eq('/users/1')
      expect(page).to have_content('fatherWar')
    end
  end
end
