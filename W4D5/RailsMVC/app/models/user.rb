class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :password_digest, :session_token,
    presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  has_many :links
  has_many :comments

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    digest_obj = BCrypt::Password.new(user.password_digest)
    digest_obj.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = self.generate_session_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= self.generate_session_token
  end

end
