# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnimalRequestsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/animal_requests').to route_to('animal_requests#index')
    end

    it 'routes to #new' do
      expect(get: '/animal_requests/new').to route_to('animal_requests#new')
    end

    it 'routes to #show' do
      expect(get: '/animal_requests/1').to route_to('animal_requests#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/animal_requests/1/edit').to route_to('animal_requests#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/animal_requests').to route_to('animal_requests#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/animal_requests/1').to route_to('animal_requests#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/animal_requests/1').to route_to('animal_requests#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/animal_requests/1').to route_to('animal_requests#destroy', id: '1')
    end
  end
end
