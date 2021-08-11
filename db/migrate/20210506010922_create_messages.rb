# frozen_string_literal: true

# Create Messages Migration
class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content

      t.belongs_to :chat, index: true
      t.belongs_to :user, index: true
      t.string :viewed

      t.timestamps
    end
  end
end
