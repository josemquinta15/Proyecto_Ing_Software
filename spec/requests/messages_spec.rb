# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/messages/show'
      expect(response).to have_http_status(:success)
    end
    it 'render message view' do
      get '/messages/show'
      expect(response).to render_template(:show)
    end
  end
end
