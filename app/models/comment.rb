# frozen_string_literal: true

require 'active_support/core_ext'

# Comment
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :sons, class_name: 'Comment', foreign_key: 'father_id', dependent: :destroy

  belongs_to :father, class_name: 'Comment', optional: true

  def user
    User.find(user_id)
  end

  def comment_time
    ''
  end

  def creation_date
    utf_4_time = (created_at.to_time - 4.hours).to_datetime
    utf_4_time.strftime('%B %d %H:%M %P')
  end
end
