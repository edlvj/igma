require 'hanami/interactor'

module IgPostInteractor
  class Fetch
    include Hanami::Interactor

    def initialize(params={})
      @tracked_ig_users = params
    end

    def call
      @tracked_ig_users.each do |ig_user| 
        @recent_media = InstagramApi.user(ig_user.profile_id).recent_media.data
        
        @recent_media.each do |media|
          IgPostInteractor::Update.new(media, ig_user.id).call
        end 
      end 
    end
  end
end  