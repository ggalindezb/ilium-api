class User < ApplicationRecord
  has_secure_password

  ROLES = %w[member admin].freeze

  validates :email, presence: true
  validates :role, inclusion: { in: ROLES }
end
