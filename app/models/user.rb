# frozen_string_literal: true

# comase
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :delete_all
  has_many :posts, dependent: :destroy
  has_many :requests, dependent: :destroy, foreign_key: :buyer_id, foreign_key: :owner_id
  has_many :messages, dependent: :delete_all
  has_and_belongs_to_many :chats, dependent: :destroy

  has_many :reports # user reports
  # Query the complaints (Reports) made against particular Users
  has_many :complaints, class_name: 'Report', foreign_key: 'author_id'
  has_many :reports # user reports
  # Query the complaints (Reports) made against particular Users
  has_many :complaints, class_name: 'Report', foreign_key: 'author_id'
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize: '256x256'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def rating
    rating = if Review.where(reid: id).any?
               Review.where(reid: id).average('rating')
             else
               0
             end
    rating.to_i
  end

  def ordered_chats
    ordered_chats = chats.sort_by(&:updated_at)
    ordered_chats.reverse
  end

  def creation_date
    utf_4_time = (created_at.to_time - 4.hours).to_datetime
    utf_4_time.strftime('%B %Y')
  end
end
