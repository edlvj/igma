class TrackingRepository < Hanami::Repository
  associations do
    belongs_to :user
    belongs_to :ig_user
  end

  def find_with_ig_users_by_user_id(user_id)
    aggregate(:ig_user).where(user_id: user_id).map_to(Tracking).to_a
  end

  def find_by_atrributes(entity)
    trackings.where { user_id.in(entity.user_id) && ig_user_id.in(entity.ig_user_id) }.one
  end
end
