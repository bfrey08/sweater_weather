require 'bcrypt'
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(api_key)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.api_key = @password
  end

end
