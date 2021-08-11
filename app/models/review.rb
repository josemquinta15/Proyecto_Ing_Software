# frozen_string_literal: true

# comment
class Review < ApplicationRecord
  def author
    User.find(aid)
  end
end
