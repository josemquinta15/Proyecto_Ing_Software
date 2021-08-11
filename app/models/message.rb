# frozen_string_literal: true

# Message Model
class Message < ApplicationRecord
  validates_presence_of :created_at
  validates_presence_of :content
  after_create_commit { MessageBroadcastJob.perform_later self }

  belongs_to :chat
  belongs_to :user

  def chat_date
    month = { 1 => 'Jan', 2 => 'Feb', 3 => 'Mar', 4 => 'Apr', 5 => 'May', 6 => 'Jun', 7 => 'Jul', 8 => 'Aug',
              9 => 'Sep', 10 => 'Oct', 11 => 'Nov', 12 => 'Dec' }
    "#{created_at.day} #{month[created_at.month]}"
  end

  def created_contact_date
    utf_4_time = (created_at.to_time - 4.hours).to_datetime
    utf_4_time.strftime('%H:%M %P, %B %d ')
  end
end
