# frozen_string_literal: true

# comment
class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.timestamps
      t.belongs_to :post, index: true
      t.belongs_to :request, index: true
    end

    create_table :chats_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :chat
    end
  end
end
