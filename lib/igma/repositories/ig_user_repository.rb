class IgUserRepository < Hanami::Repository
  associations do
    has_many :trackings
    has_many :users, through: :trackings
  end

  def find_by_profile_id(profile_id)
    ig_users
      .where(profile_id: profile_id)
      .one
  end
end
