require 'rails_helper'

RSpec.describe ExpendituresController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/transactions').to route_to('expenditures#index')
    end

    it 'routes to #new' do
      expect(get: '/transactions/new').to route_to('expenditures#new')
    end

    it 'routes to #show' do
      expect(get: '/transactions/1').to route_to('expenditures#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/transactions/1/edit').to route_to('expenditures#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/transactions').to route_to('expenditures#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/transactions/1').to route_to('expenditures#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/transactions/1').to route_to('expenditures#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/transactions/1').to route_to('expenditures#destroy', id: '1')
    end
  end
end
