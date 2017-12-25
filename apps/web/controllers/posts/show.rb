module Web::Controllers::Posts
  class Show
    include Web::Action
    before :authenticate!
    
    params do
      required(:id) { filled? & int? }
    end

    expose :post

    def call(params)
      if params.valid?
        @post = IgPostRepository.new.find_with_comment_by_id(params[:id])
        not_found unless @post
      else
        not_found
      end  
    end

    private

    def not_found
      halt 404, "Not found post"
    end
  end
end
