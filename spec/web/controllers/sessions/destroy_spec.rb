describe Web::Controllers::Sessions::Destroy do
  let(:action) { Web::Controllers::Sessions::Destroy.new }
  let(:params) { Hash[] }

  let(:user_repo) { UserRepository.new }
  let(:account) { user_repo.create(name: 'Batko', email: 'test@test.com', password: 'test') }

  describe 'when not logged in' do
    it 'redirect to sign in' do
      response = action.call(params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/sessions/new')
    end
  end

  describe 'when logged in' do
    let(:session) { { user_id: account.id } }
    let(:params)  { { 'rack.session' => session} }

    it 'redirect to sign in' do
      response = action.call(params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/sessions/new')
    end
  end
end
