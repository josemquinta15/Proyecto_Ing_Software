# frozen_string_literal: true

# comment for rubobp to work
class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :text
      t.date :date
      t.string :comment_type

      t.belongs_to :user, index: true
      t.belongs_to :post, index: true

      t.references :father, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
