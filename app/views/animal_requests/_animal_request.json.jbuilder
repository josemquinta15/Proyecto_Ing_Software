# frozen_string_literal: true

json.extract! animal_request, :id, :name, :email, :animal, :message, :created_at, :updated_at
json.url animal_request_url(animal_request, format: :json)
