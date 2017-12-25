require 'bcrypt'
require 'hanami/interactor'

module SeedInteractor
  include Hanami::Interactor
  include BCrypt

  def initialize(params={})
    user_repo = UserRepository.new
    ig_user_repo = IgUserRepository.new
    tracking_repo = TrackingRepository.new
  end

  def call
    user = user_repo.create(name: 'testy', email: 'test@test.com', password: Password.create(111111))
    ig_user = ig_user_repo.create(profile_id: 30624400, username: 'edwardlovejoy', image: 'image') 
    tracking_repo.create(ig_user_id: ig_user.id, user_id: user.id)
  end
end