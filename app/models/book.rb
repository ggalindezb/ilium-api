class Book < ApplicationRecord
  validates :title, :author, presence: true

  def release!
    update!(reserve: false)
  end

  def reserve!
    update!(reserve: true)
  end
end
