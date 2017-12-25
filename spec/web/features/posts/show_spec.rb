require 'features_helper'

describe 'Post show' do
  let(:repo) { UserRepository.new }
  let(:ig_user_repo) { IgUserRepository.new }
  let(:ig_post_repo) { IgPostRepository.new }
  let(:ig_comment_repo) { IgCommentRepository.new }

  before :each do
    create(:user)
  end

  it 'return 404' do
    page.set_rack_session(user_id: repo.last.id)
    page.visit '/posts/fd'

    expect(page).to have_content 'Not found post'
  end

  it 'contain likes, text and comments' do
    ig_user = create(:ig_user)
    ig_post = create(:ig_post, ig_user_id: ig_user_repo.last.id)
    ig_comment = create(:ig_comment, ig_post_id: ig_post_repo.last.id)
    page.set_rack_session(user_id: repo.last.id)
    page.visit "/posts/#{ ig_post_repo.last.id }"
    
    expect(page).to have_content ig_post_repo.last.likes_count
    expect(page).to have_content ig_post_repo.last.text
    expect(page).to have_content ig_comment_repo.last.text
  end
end