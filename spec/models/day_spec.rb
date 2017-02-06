require 'rails_helper'

RSpec.describe Day, type: :model do
  describe '#day' do
    describe 'presence validation' do
      context 'with a nil date' do
        let(:day) { build(:day, date: nil) }

        it 'should be invalid' do
          expect(day.valid?).to be(false)
        end
      end

      context 'with an invalid date' do
        let(:day) { build(:day, date: 'abcdefg') }

        it 'should be invalid' do
          expect(day.valid?).to be(false)
        end
      end
    end

    describe 'uniqueness validation' do
      before(:each) do
        create(:day, date: '2017-01-01')
      end

      context 'with a day with the same date as another record' do
        let(:day) { build(:day, date: '2017-01-01') }

        it 'should be invalid' do
          expect(day.valid?).to be(false)
        end
      end
    end
  end
end
