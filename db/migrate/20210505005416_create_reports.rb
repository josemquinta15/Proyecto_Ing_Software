# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :author_id
      t.string :text
      t.bigint :post_id
      # t.datetime "created_at", null: false
      # t.datetime "updated_at", null: false
      t.index ['post_id'], name: 'index_reports_on_post_id'
      t.index ['user_id'], name: 'index_reports_on_user_id'
      t.timestamps
    end
  end
end
