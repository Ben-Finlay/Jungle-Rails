class User < ApplicationRecord

  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 4 }
  before_save { email.downcase! }

  has_secure_password

  def authenticate_with_credentials(email, password)
    email.downcase!
    email.strip!
    @user = User.find_by_email(email)

    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end
  
end
