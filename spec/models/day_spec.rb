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

      context 'with a valid date' do
        let(:day) { build(:day) }

        it 'should be valid' do
          expect(day.valid?).to be(true)
        end
      end
    end

    describe 'uniqueness validation' do
      before(:each) do
        create(:day)
      end

      context 'with a day with the same date as another record' do
        let(:day) { build(:day) }

        it 'should be invalid' do
          expect(day.valid?).to be(false)
        end
      end

      context 'with a day with a new date' do
        let(:day) { build(:day, :today) }

        it 'should be valid' do
          expect(day.valid?).to be(true)
        end
      end
    end
  end
end
