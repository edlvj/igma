require 'hanami/interactor'

module TrackingInteractor
  class Create
    include Hanami::Interactor

    def initialize(params={})
      @tracking = Tracking.new(params)
    end

    def call
      repo = TrackingRepository.new
      
      fail! if repo.find_by_atrributes(@tracking)
      repo.create(@tracking)
    end
  end
end 