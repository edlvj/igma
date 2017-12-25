class IgPostRepository < Hanami::Repository
  associations do
    belongs_to :ig_user
    has_many :ig_comments
  end

  def find_with_comment_by_id(id)
    aggregate(:ig_comments).where(id: id).map_to(IgPost).one
  end

  def find_by_ig_user_ids(ig_user_ids)
    ig_posts
      .where{ ig_user_id.in(ig_user_ids) }
      .as(IgPost).to_a
  end

  def find_by_media_id(media_id)
    ig_posts
      .where(media_id: media_id)
      .one
  end  
end
