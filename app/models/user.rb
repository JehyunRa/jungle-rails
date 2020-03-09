class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  validates :email, :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates_length_of :password, minimum: 3
  has_secure_password

end
