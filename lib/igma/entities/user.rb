require 'bcrypt'

class User < Hanami::Entity
  include BCrypt
  
  def user_password?(password)
    Password.new(self.password) == password
  end
end
