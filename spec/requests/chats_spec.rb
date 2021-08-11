# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Chats', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/chats/show'
      expect(response).to have_http_status(:success)
    end
    it 'render chat view' do
      get '/chats/show'
      expect(response).to render_template(:show)
    end
  end
end
