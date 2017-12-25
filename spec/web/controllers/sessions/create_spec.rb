require 'bcrypt'

describe Web::Controllers::Sessions::Create do
  let(:action) { Web::Controllers::Sessions::Create.new }
  
  let(:user_repo) { UserRepository.new }
  let(:account) { user_repo.create(name: 'stepa', email: 'foo@mail.com', password: BCrypt::Password.create('secret123')) }

  describe 'when not logged in' do
    let(:invalid_params) { Hash[session: { email: 'foo@mail.com', password: 'fd'}] }
    let(:valid_params) { Hash[session: { email: 'foo@mail.com', password: 'secret123'}] }

    it 'on invalid return validation errors' do
      response = action.call(invalid_params)
      expect(response[0]).to eq(422)
    end

    before do
      user_repo.create(name: 'stepa', email: 'foo@mail.com', password: BCrypt::Password.create('secret123'))
    end

    it 'on valid redirect to root' do
      response = action.call(valid_params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/posts')
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