require 'rails_helper'

RSpec.describe Event, type: :model do
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
