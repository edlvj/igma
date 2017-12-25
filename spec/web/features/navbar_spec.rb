require 'features_helper'

describe 'Navbar' do
  let(:repo) { UserRepository.new }

  before :each do
    create :user
  end
  
  context 'then not logged' do
    it 'it not contain navbar' do
      visit '/'
      expect(page).to_not have_css('nav')
    end
  end

  context 'then logged' do
    it 'contain navbar items' do
      page.set_rack_session(user_id: repo.last.id)
      page.visit '/'

      within 'nav' do
        expect(page).to have_content('Posts')
        expect(page).to have_content('Trackings')
      end  
    end

    it 'on logout redirect to sign in' do
      page.set_rack_session(user_id: repo.last.id)
      page.visit '/'

      within 'nav' do
        click_button 'logout'
      end  

      expect(page).to have_current_path '/sessions/new'
    end
  end
end