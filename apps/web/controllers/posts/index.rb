module Web::Controllers::Posts
  class Index
    include Web::Action
    before :authenticate!

    expose :posts

    def call(params)
      @posts = []
      user_repo = UserRepository.new
      ig_post_repo = IgPostRepository.new
      
      user = user_repo.find_with_ig_users(current_user.id)
      @tracked_users = user.ig_users

      if @tracked_users.any?
        ig_user_ids = @tracked_users.map(&:id)
        @posts = ig_post_repo.find_by_ig_user_ids(ig_user_ids)
        IgPostInteractor::Fetch.new(@tracked_users).call if @posts.count == 0
      end
    end
  end
end
