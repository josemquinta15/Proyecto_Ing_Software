# frozen_string_literal: true

json.extract! request, :id, :rqid, :guest_user_id, :host_user_id, :state, :chid, :date, :created_at, :updated_at
json.url request_url(request, format: :json)
