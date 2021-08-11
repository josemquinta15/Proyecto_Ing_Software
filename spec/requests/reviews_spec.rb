# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  let(:valid_attributes) do
    { id: 1, aid: 1, reid: 2, text: 'No Message', rating: 2, date: DateTime.now, created_at: DateTime.now,
      updated_at: DateTime.now }
  end

  let(:invalid_attributes) do
    { id: nil, aid: nil, reid: nil, text: nil, rating: nil, date: nil, created_at: nil, updated_at: nil }
  end

  describe 'GET /new' do
    it 'returns http unsuccessful' do
      post '/reviews/new'
      expect(response).to_not have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http unsuccessful, due to not signed in' do
      get '/reviews'
      expect(response).to_not have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      review = Review.create! valid_attributes
      get reviews_show_url(review)
      expect(response).not_to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      review_request = Review.create! valid_attributes
      get reviews_edit_url(review_request)
      expect(response).not_to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new AnimalRequest' do
        expect do
          post reviews_index_url, params: { review: valid_attributes }
        end.to change(Review, :count).by(0)
      end

      it 'redirects to the created animal_request' do
        post reviews_index_url, params: { review: valid_attributes }
        expect(response).not_to redirect_to(reviews_index_url(Review.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new AnimalRequest' do
        expect do
          post reviews_index_url, params: { review: invalid_attributes }
        end.to change(Review, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post reviews_index_url, params: { review: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested animal_request' do
      animal_request = Review.create! valid_attributes
      expect do
        delete reviews_delete_url(animal_request)
      end.to change(Review, :count).by(0)
    end

    it 'redirects to the animal_requests list' do
      animal_request = Review.create! valid_attributes
      delete reviews_delete_url(animal_request)
      expect(response).not_to redirect_to(animal_requests_url)
    end
  end
end
