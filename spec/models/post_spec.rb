# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'post attributes' do
    it 'complete post valid' do
      user = User.create(email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678',
                         last_name: 'Quintana', first_name: 'José Miguel', phone: '997764456', city: 'Santiago',
                         gender: 'M')
      post = Post.create(title: 'golden retriever', text: 'description', price: '230.000', level: '1', animal: 'Dog',
                         ptype: 'Sell', location: 'Santiago', user_id: user.id, date: DateTime.now)
      expect(post).to be_valid
    end
    it 'post without user_id invalid' do
      post = Post.create(title: 'golden retriever', text: 'description', price: '230.000', level: '1', animal: 'Dog',
                         ptype: 'Sell', location: 'Santiago', date: DateTime.now)
      expect(post).to_not be_valid
    end
    it 'empty post invalid' do
      post = Post.create
      expect(post).to_not be_valid
    end
  end
end
