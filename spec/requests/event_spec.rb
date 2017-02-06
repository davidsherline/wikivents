require 'rails_helper'

RSpec.describe 'Event browsing', :vcr, type: :request do
  it 'Gets the articles for the date requested' do
    get '/', params: { date: '2017-2-2' }
    expect(response.body).to include('February 02, 2017')
  end
end
