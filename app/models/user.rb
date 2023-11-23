class User < ApplicationRecord
  has_secure_password

  ROLES = %w[member admin].freeze
  AUTH_KEY = ENV.fetch('AUTH_KEY', nil)

  validates :email, presence: true
  validates :role, inclusion: { in: ROLES }

  def as_json(_options = {})
    {
      id:,
      email:,
      role:
    }
  end

  def jwt
    raise ArgumentError if AUTH_KEY.nil?

    payload = {
      user_id: id,
      role:
    }

    JWT.encode(payload, AUTH_KEY)
  end
end
