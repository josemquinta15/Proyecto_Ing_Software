# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'user attributes' do
    it 'name is valid' do
      user = User.new(first_name: nil)
      expect(user).to_not be_valid
    end
    it 'last name is valid' do
      user = User.new(last_name: nil)
      expect(user).to_not be_valid
    end
    it 'email is valid' do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end
    it 'expect complete user valid' do
      user = User.create(email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678',
                         last_name: 'Quintana', first_name: 'José Miguel', phone: '997764456', city: 'Santiago',
                         gender: 'M')
      expect(user).to be_valid
    end
  end
end
