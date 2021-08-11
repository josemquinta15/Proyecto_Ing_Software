# frozen_string_literal: true

# comment for rubobp to work
class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :aid
      t.integer :reid
      t.text :text, null: false, default: 'No Message'
      t.float :rating
      t.datetime :date

      t.timestamps
    end
  end
end
