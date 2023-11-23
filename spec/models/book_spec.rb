require 'rails_helper'

describe Book do
  subject { described_class.new(author: 'Marcus Aurelius', title: 'Meditations') }

  describe 'validations' do
    context 'when valid' do
      it { is_expected.to be_valid }
    end

    context 'when invalid' do
      before do
        subject.assign_attributes(author: '', title: '')
        subject.valid?
      end

      it { is_expected.not_to be_valid }
      its(:errors) { are_expected.to be_present }
    end
  end

  describe '#release!' do
    before do
      subject.update!(reserved: true)
      subject.release!
    end

    its(:reserved) { is_expected.to be false }
  end

  describe '#reserve!' do
    before do
      subject.update!(reserved: false)
      subject.reserve!
    end

    its(:reserved) { is_expected.to be true }
  end
end
