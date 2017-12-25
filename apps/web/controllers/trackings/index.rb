module Web::Controllers::Trackings
  class Index
    include Web::Action
    before :authenticate!

    expose :trackings

    def call(params)
      @trackings = TrackingRepository.new.find_with_ig_users_by_user_id(current_user.id)
    end
  end
end
