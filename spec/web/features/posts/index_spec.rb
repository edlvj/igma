require 'features_helper'

describe 'Post index' do
  let(:repo) { UserRepository.new }
  let(:ig_user_repo) { IgUserRepository.new }
  let(:ig_post_repo) { IgPostRepository.new }

  before :each do
    create(:user)
  end

  it 'return message if empty' do
    page.set_rack_session(user_id: repo.last.id)
    page.visit '/posts'
    
    expect(page).to have_content 'No posts'
  end

   it 'contain likes, text' do
    ig_user = create(:ig_user)
    create(:tracking, ig_user_id: ig_user_repo.last.id, user_id: repo.last.id)
    ig_post = create(:ig_post, ig_user_id: ig_user_repo.last.id)
    page.set_rack_session(user_id: repo.last.id)
    page.visit '/posts'
    
    expect(page).to have_content ig_post_repo.last.likes_count
    expect(page).to have_content ig_post_repo.last.text
  end
end