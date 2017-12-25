require 'features_helper'

include Support::FormHelper

describe 'Sign Up' do
  let(:user) { create :user }

  before :each do
    visit '/registrations/new'
  end

  it 'contain title and form' do
  	expect(page).to have_content 'Sign Up'
    expect(page).to have_css('form#user-form')
  end

  context 'fill form' do
    it 'redirect to sign in' do
      fill_sign_up_form('form#user-form', attributes_for(:user))
      expect(page).to have_current_path '/sessions/new'
    end

    it 'redirect to sign in' do
      fill_sign_up_form('form#user-form', attributes_for(:user, :invalid)) 
      expect(page).to have_content('Password length must be within 6 - 12')
      expect(page).to have_content('Email is in invalid format')
    end
  end
end