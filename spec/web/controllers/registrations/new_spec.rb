describe Web::Controllers::Registrations::New do
  let(:action) { Web::Controllers::Registrations::New.new }

  let(:user_repo) { UserRepository.new }
  let(:account) { user_repo.create(name: 'Batko', email: 'test@test.com', password: 'test') }
  let(:session) { { user_id: account.id } }
  
  describe 'when not logged in' do
    let(:params) { Hash[] }

    it 'redirect to sign in' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end
  
  describe 'when logged in' do
    let(:params)  { { 'rack.session' => session, 'HTTP_REFERER'=> '/posts' } }

    it 'redirect to back' do
      response = action.call(params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/posts')
    end
  end
end
