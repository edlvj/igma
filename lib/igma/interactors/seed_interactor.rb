require 'bcrypt'
require 'hanami/interactor'

class SeedInteractor
  include Hanami::Interactor
  include BCrypt

  def initialize(params={}) 
  end

  def call
    user = UserRepository.new.create(name: 'testy', email: 'test@test.com', password: Password.create(111111))
    ig_user = IgUserRepository.new.create(profile_id: 30624400, username: 'edwardlovejoy', image: 'image') 
    TrackingRepository.new.create(ig_user_id: ig_user.id, user_id: user.id)
  end
end