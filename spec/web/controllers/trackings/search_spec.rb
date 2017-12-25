describe Web::Controllers::Trackings::Search do
  let(:action) { Web::Controllers::Trackings::Search.new }
  
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
    let(:invalid_params) { { search: { username: ''}, 'rack.session' => session } }
    let(:valid_params) { { search: { username: 'hanumak'}, 'rack.session' => session } }
    it 'on invalid return validation errors' do
      response = action.call(invalid_params)
      expect(response[0]).to eq(422)
    end

    it 'on valid redirect to root' do
      response = action.call(valid_params)
      expect(response[0]).to eq(200)
    end
  end
end
