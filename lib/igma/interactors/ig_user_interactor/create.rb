require 'hanami/interactor'

module IgUserInteractor
  class Create
    include Hanami::Interactor
    
    expose :ig_user

    def initialize(params={})
      @new_ig_user = IgUser.new(params)
    end

    def call
      repo = IgUserRepository.new
      @ig_user = repo.find_by_profile_id(@new_ig_user.profile_id)
      
      unless @ig_user
        @ig_user = repo.create(@new_ig_user)
      end
      @ig_user
    end
  end
end  