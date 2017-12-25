require 'hanami/interactor'

module IgPostInteractor
  class Update
    include Hanami::Interactor

    def initialize(params={}, ig_user_id)
      @media = params
      @ig_user_id = ig_user_id
    end

    def call
      repo = IgPostRepository.new
      
      @post = repo.find_by_media_id(@media.id)

      @ig_post = if @post
        repo.update(@post.id, {
          likes_count: @media.likes.count,
          image_url: @media.images.standard_resolution.url,
          text: @media.caption ? @media.caption.text : @media.text,
          }
        )
      else
        @ig_post = repo.create(
          media_id: @media.id,
          likes_count: @media.likes.count,
          image_url: @media.images.standard_resolution.url,
          text: @media.caption ? @media.caption.text : @media.text,
          ig_user_id: @ig_user_id
        )
      end
      
      if @media.comments.count > 0
        IgCommentInteractor::Update.new(@ig_post).call
      end
    end
  end
end