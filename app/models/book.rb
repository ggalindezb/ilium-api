class Book < ApplicationRecord
  validates :title, :author, presence: true

  def release!
    update!(reserved: false)
  end

  def reserve!
    update!(reserved: true)
  end
end
