# frozen_string_literal: true

require 'rails_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_request_url
    expect(response).to have_http_status(:success)
  end

  test 'should get index' do
    get requests_url
    expect(response).to have_http_status(:success)
  end

  test 'should get show' do
    get request_url
    expect(response).to have_http_status(:success)
  end

  test 'should get edit' do
    get edit_request_url
    expect(response).to have_http_status(:success)
  end
end
