# frozen_string_literal: true

# comment for rubobp to work
class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :state
      t.integer :chid
      t.string :reviewed_own
      t.string :reviewed_buy
      t.string :viewed

      t.belongs_to :post, index: true

      t.references :owner, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
