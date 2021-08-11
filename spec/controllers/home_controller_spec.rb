# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'HomeController' do
  describe 'GET /home' do
    it 'get success code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
