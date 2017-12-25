class IgCommentRepository < Hanami::Repository

  def find_by_comment_id(comment_id)
    ig_comments
      .where(comment_id: comment_id)
      .one
  end
end
