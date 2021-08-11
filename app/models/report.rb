# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
