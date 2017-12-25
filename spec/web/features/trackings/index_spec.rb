require 'features_helper'

describe 'Tracking index' do
  let(:repo) { UserRepository.new }
  let(:ig_user_repo) { IgUserRepository.new }

  before :each do
    create(:user)
  end

  it 'contain title' do
    page.set_rack_session(user_id: repo.last.id)
    page.visit '/trackings'
    
    expect(page).to have_content 'Trackings'
  end

  it 'return message if empty' do
    page.set_rack_session(user_id: repo.last.id)
    page.visit '/trackings'
    
    expect(page).to have_content 'You aren\'t tracking anybody'
  end

  it 'return message if empty' do
    create(:ig_user, username: 'edwardlovejoy')
    create(:tracking, ig_user_id: ig_user_repo.last.id, user_id: repo.last.id)
    page.set_rack_session(user_id: repo.last.id)
    page.visit '/trackings'
    
    expect(page).to have_content 'edwardlovejoy'
    expect(page).to have_button 'Delete'
  end
end
