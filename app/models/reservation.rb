class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :code, :pick_up_time, presence: true

  class << self
    def with_code(attributes = {})
      code = SecureRandom.hex
      new(attributes.merge(code:))
    end
  end
end
