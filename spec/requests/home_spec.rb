# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'test' do
    it 'renders home view' do
      get '/'
      expect(response).to render_template('home/index', 'layouts/application')
    end
  end
end
