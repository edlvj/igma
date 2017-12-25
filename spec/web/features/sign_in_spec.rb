require 'features_helper'

include Support::FormHelper

describe 'Sign In' do
 
  before :each do
    visit '/sessions/new'
  end

  it 'contain title and form' do
    expect(page).to have_content 'Sign In'
    expect(page).to have_css('form#session-form')
  end

  context 'fill form' do
    before do
      user = create(:user)
    end
    it 'redirect to sign in' do
      fill_sign_in_form('form#session-form', attributes_for(:user))
      expect(page).to have_current_path '/posts'
    end

    it 'redirect to sign in' do
      fill_sign_in_form('form#session-form', attributes_for(:user, :invalid)) 
      expect(page).to have_content('Password length must be within 6 - 12')
      expect(page).to have_content('Email is in invalid format')
    end
  end
end