# frozen_string_literal: true

# comment
class Chat < ApplicationRecord
  has_many :messages
  has_and_belongs_to_many :users
  belongs_to :post
  belongs_to :request
  # attr_accessor :active

  # def initialize
  #     @active = false
  # end

  def ordered_messages
    messages.sort_by(&:created_at)
  end

  def has_notifications?
    has_not = false
    messages.each do |message|
      has_not = true if message.viewed == 'false'
    end

    has_not
  end

  def messages_not_read
    count = 0
    messages.each do |message|
      count += 1 if message.viewed == 'false'
    end
    count
  end
end
