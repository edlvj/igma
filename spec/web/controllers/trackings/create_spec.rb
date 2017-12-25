describe Web::Controllers::Trackings::Create do
  let(:action) { Web::Controllers::Trackings::Create.new }

  let(:user_repo) { UserRepository.new }

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
    let(:invalid_params)  { { 'rack.session' => session} }
    let(:valid_params)  { {ig_user: { profile_id: '3232', username: 'hgghghh', image: 'fdf'}, 'rack.session' => session} }

    it 'return 422' do
      response = action.call(invalid_params)
      expect(response[0]).to eq(422)
    end

    it 'redirect to new tracking' do
      response = action.call(valid_params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/trackings/new')
    end
  end
end