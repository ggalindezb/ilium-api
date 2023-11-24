class Book < ApplicationRecord
  validates :title, :author, presence: true

  scope :available, -> { where(reserved: false) }
  scope :with_author_substring, ->(term) { where('author ILIKE ?', "%#{term}%") }
  scope :with_title_substring, ->(term) { where('title ILIKE ?', "%#{term}%") }

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
