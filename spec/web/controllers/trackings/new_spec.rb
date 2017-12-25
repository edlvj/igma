describe Web::Controllers::Trackings::New do
  let(:action) { Web::Controllers::Trackings::New.new }

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
    let(:params)  { { 'rack.session' => session} }

    it 'return page' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end
end
