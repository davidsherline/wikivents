require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    let(:date) { '2017-1-1' }

    before(:each) do
      stub_request(:any, /en.wikipedia.org/)
        .to_return(body: File.new('spec/fixtures/files/summary.html'),
                   status: 200)

      get :index, params: { date: date }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
