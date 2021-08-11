# frozen_string_literal: true

require 'rails_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get reviews_new_url
    expect(response).to have_http_status(:success)
  end

  test 'should get index' do
    get reviews_index_url
    expect(response).to have_http_status(:success)
  end

  test 'should get show' do
    get reviews_show_url
    expect(response).to have_http_status(:success)
  end

  test 'should get edit' do
    get reviews_edit_url
    expect(response).to have_http_status(:success)
  end

  test 'should get delete' do
    get reviews_delete_url
    expect(response).to have_http_status(:success)
  end
  test 'should get update' do
    get reviews_update_url
    expect(response).to have_http_status(:success)
  end
end
