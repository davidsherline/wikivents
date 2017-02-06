require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '.on' do
    context 'with three events on the same day' do
      let(:day) { create(:day, :yesterday) }

      before(:each) do
        create_list(:event, 3, day: day)
      end

      it 'should return three events' do
        expect(Event.on(day).count).to eq(3)
      end
    end
  end

  describe '#title' do
    describe 'presence validation' do
      context 'with a nil title' do
        let(:event) { build(:event, title: nil) }

        it 'should be invalid' do
          expect(event.valid?).to be(false)
        end
      end
    end
  end

  describe '#summary' do
    describe 'presence validation' do
      context 'with a nil summary' do
        let(:event) { build(:event, summary: nil) }

        it 'should be invalid' do
          expect(event.valid?).to be(false)
        end
      end
    end
  end
end
