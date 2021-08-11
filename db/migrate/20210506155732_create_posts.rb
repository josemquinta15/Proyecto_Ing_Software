# frozen_string_literal: true

# comment for rubobp to work
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :text
      t.string :title
      t.integer :price
      t.integer :level
      t.date :date
      t.string :animal
      t.string :ptype
      t.string :location

      t.belongs_to :user, index: true
      t.references :report, foreign_key: true
      t.timestamps
    end
  end
end
