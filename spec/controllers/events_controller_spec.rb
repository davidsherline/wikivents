require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index', :vcr do
    let(:date) { '2017-1-15' }

    before(:each) do
      get :index, params: { date: date }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
