describe Web::Controllers::Posts::Show do
  let(:action) { Web::Controllers::Posts::Show.new }

  let(:user_repo) { UserRepository.new }
  let(:ig_post_repo) { IgPostRepository.new }
  let(:ig_user_repo) { IgUserRepository.new }

  let(:account) { user_repo.create(name: 'Batko', email: 'test@test.com', password: 'test') }
  let(:session) { { user_id: account.id } }
  
  describe 'when not logged in' do
    let(:params) { Hash[] }
    it 'redirect to sign in' do
      response = action.call(params)
      expect(response[0]).to eq(302)
    end
  end

  describe 'when logged in' do
    let(:ig_user)  { ig_user_repo.create(profile_id: 23232323, username: 'username', image: 'image') }
    let(:ig_post)  { ig_post_repo.create(media_id: '23232323', likes_count: 23, image_url: 'dsdsd', ig_user_id: ig_user.id) }
    let(:params)  { { id: ig_post.id, 'rack.session' => session } }

    it 'redirect to back' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end
end
