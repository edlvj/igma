describe Web::Controllers::Trackings::Destroy do
  let(:action) { Web::Controllers::Trackings::Destroy.new }

  let(:user_repo) { UserRepository.new }
  let(:ig_user_repo) { IgUserRepository.new }
  let(:tracking_repo) { TrackingRepository.new }

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
    let(:ig_user) { ig_user_repo.create(profile_id: 23232323, username: 'username', image: 'image') }
    let(:tracking) { tracking_repo.create(user_id: account.id, ig_user_id: ig_user.id) }
    let(:params)  { { id: tracking.id, 'rack.session' => session} }

    it 'redirect to tracking' do
      response = action.call(params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/trackings')
    end

    it 'redirect to tracking' do
      response = action.call(params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/trackings')
    end
  end
end
