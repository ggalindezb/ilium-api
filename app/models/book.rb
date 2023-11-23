class Book < ApplicationRecord
  validates :title, :author, presence: true

  scope :available, -> { where(reserved: false) }

  def as_json(_options = {})
    {
      id:,
      title:,
      author:,
      reserved:
    }
  end

  def release!
    update!(reserved: false)
  end

  def reserve!
    update!(reserved: true)
  end
end
