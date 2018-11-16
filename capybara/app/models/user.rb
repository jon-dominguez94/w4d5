class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  attr_reader :password

  def password=(password)
    @password = password

  end

  def is_password?
  end

  def ensure_session_token
  end

  def reset_session_token!
  end

  def self.find_by_credentials(username, password)
  end

  private

  def generate_session_token
  end
end
