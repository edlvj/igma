require 'features_helper'

include Support::FormHelper

describe 'Tracking search' do
  let(:repo) { UserRepository.new }

  before :each do
    create(:user)
  end

  it 'contain title and form' do
    page.set_rack_session(user_id: repo.last.id)
    page.visit '/trackings/new'
    
    expect(page).to have_content 'Search by instagram username'
    expect(page).to have_css('form#search-form')
  end

  context 'fill search form' do
    it 'return errors then empty' do
      page.set_rack_session(user_id: repo.last.id)
      page.visit '/trackings/new'

      fill_search_form('form#search-form', '')
       
      expect(page).to have_content('Username must be filled')
    end

    it 'return user with add button' do
      page.set_rack_session(user_id: repo.last.id)
      page.visit '/trackings/new'
      
      fill_search_form('form#search-form', 'edwardlovejoy')
      
      within '.list-group.container' do
        expect(page).to have_content('edwardlovejoy')
        expect(page).to have_button('Add')
      end
    end
  end

  context 'add user to track' do
    it 'return success flash' do
      page.set_rack_session(user_id: repo.last.id)
      page.visit '/trackings/new'

      fill_search_form('form#search-form', 'edwardlovejoy')

      click_button 'Add'
      expect(page).to have_content('Tracking added.')
    end
  end
end