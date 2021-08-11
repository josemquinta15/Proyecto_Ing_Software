# frozen_string_literal: true

# comment
class Post < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :reports, dependent: :destroy

  def creation_date
    utf_4_time = (created_at.to_time - 4.hours).to_datetime
    utf_4_time.strftime('%B %d %H:%M %P')
  end

  def parsed_price
    process_price = []
    price_list = price.to_s.split("")
    counter = 0
    for i in (price_list.count-1).downto(0)
      process_price.insert(0, price_list[i])
      counter += 1
      if counter % 3 == 0 and i != 0
        process_price.insert(0, '.')
      end
    end
    return process_price.insert(0, '$').join("")
  end
end
