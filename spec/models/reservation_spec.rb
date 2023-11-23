require 'rails_helper'

describe Reservation do
  subject do
    user = User.create(email: 'test@sample.com', password: 'test')
    book = Book.create(author: 'Marcus Aurelius', title: 'Meditations')

    described_class.with_code(pick_up_time: 5.minutes.from_now, user:, book:)
  end

  describe '.with_code' do
    it { is_expected.to be_valid }
    its(:code) { is_expected.to be_present }
  end
end
