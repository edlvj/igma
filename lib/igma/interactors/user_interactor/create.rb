require 'bcrypt'
require 'hanami/interactor'

module UserInteractor
  class Create
    include Hanami::Interactor
    include BCrypt

    def initialize(params={})
      params[:password] = Password.create(params[:password])
      @user = User.new(params)
    end

    def call
      repo = UserRepository.new
      fail! if repo.find_by_email(@user.email) 
      repo.create(@user)
    end
  end
end 