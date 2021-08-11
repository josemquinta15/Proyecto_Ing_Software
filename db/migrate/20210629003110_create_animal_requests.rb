# frozen_string_literal: true

# comment
class CreateAnimalRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_requests do |t|
      t.string :name
      t.string :email
      t.string :animal
      t.string :message

      t.timestamps
    end
  end
end
