module Web::Controllers::Trackings
  class Search
    include Web::Action
    before :authenticate!
    
    expose :users

    params do
      required(:search).schema do
        required(:username) { filled? & str? }
      end
    end

    def call(params)
      @users = []

      if params.valid?
        @users = InstagramApi.user.search(params[:search][:username], {count: 10}).data
      else
        self.status = 422
      end 
    end
  end
end
