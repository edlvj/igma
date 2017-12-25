require 'bcrypt'

include BCrypt

describe User do
  it 'can be initialized with attributes' do
    user = User.new(name: 'Batko', email: 'test@test.com', password: 'test')
    expect(user.name).to eq('Batko')
    expect(user.email).to eq('test@test.com')
    expect(user.password).to eq('test')
  end

  it '#user_password' do
    user = User.new(name: 'Batko', email: 'test@test.com', password: Password.create('test'))
    expect(user.user_password?('test')).to eq(true)
  end
end
