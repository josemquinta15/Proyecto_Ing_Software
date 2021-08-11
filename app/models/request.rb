# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  belongs_to :post
  has_one :chat
end
