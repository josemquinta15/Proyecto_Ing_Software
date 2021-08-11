# frozen_string_literal: true

json.array! @animal_requests, partial: 'animal_requests/animal_request', as: :animal_request
