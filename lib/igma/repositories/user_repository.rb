class UserRepository < Hanami::Repository
	associations do
    has_many :trackings
    has_many :ig_users, through: :trackings
  end

	def find_by_email(email)
    users
      .where(email: email)
      .one
  end

  def find_with_ig_users(id)
    aggregate(:ig_users).where(id: id).map_to(User).one
  end
end
