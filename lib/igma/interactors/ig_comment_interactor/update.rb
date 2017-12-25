require 'hanami/interactor'

module IgCommentInteractor
  class Update
    include Hanami::Interactor

    def initialize(params={})
      @ig_post = params
    end

    def call
      repo = IgCommentRepository.new
      @media_comments = InstagramApi.media(@ig_post.media_id).comments.data

      @media_comments.each do |comment| 
        @comment = repo.find_by_comment_id(comment.id)

        if @comment
          repo.update(@comment.id, {
            profile_username: comment.from.username,
            text: comment.text
            }
          )
        else
          repo.create(
            profile_username: comment.from.username,
            text: comment.text,
            comment_id: comment.id,  
            ig_post_id: @ig_post.id
          )
        end
      end
    end
  end
end