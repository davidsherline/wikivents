require 'rails_helper'

RSpec.describe 'routes for Events', type: :routing do
  it 'routes / to events#index' do
    expect(get('/')).to route_to('events#index')
  end
end
