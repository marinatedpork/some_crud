class User < ActiveRecord::Base
	has_many :comments
	has_many :posts

	def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(pw)
    self.password == pw
  end

end
