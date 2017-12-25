describe Web::Controllers::Registrations::Create do
  let(:action) { Web::Controllers::Registrations::Create.new }
  let(:invalid_params) { Hash[user: { name: 'Foo', email: 'foo@mail.com', password: ''}] }
  let(:valid_params) { Hash[user: { name: 'foooods', email: 'foo@mail.com', password: 'secret123'}] }

  let(:user_repo) { UserRepository.new }
  let(:account) { user_repo.create(name: 'Batko', email: 'test@test.com', password: 'test') }

  describe 'when not logged in' do
    it 'on invalid return validation errors' do
      response = action.call(invalid_params)
      expect(response[0]).to eq(422)
	  end

    it 'on valid redirect to sign_in' do
	    response = action.call(valid_params)
	    expect(response[0]).to eq(302)
      
	    expect(response[1]['Location']).to eq('/sessions/new')
	  end
	end

	describe 'when logged in' do
    let(:session) { { user_id: account.id } }
    let(:params)  { { 'rack.session' => session, 'HTTP_REFERER'=> '/posts' } }

    it 'redirect to back' do
      response = action.call(params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/posts')
    end
	end
end
