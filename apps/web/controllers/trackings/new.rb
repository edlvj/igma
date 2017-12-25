module Web::Controllers::Trackings
  class New
    include Web::Action
    before :authenticate!

    expose :users

    def call(params)
      @users = []
    end
  end
end
