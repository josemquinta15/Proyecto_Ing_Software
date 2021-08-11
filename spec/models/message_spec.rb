# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'when accesing a message' do
    describe 'chat_date method' do
      it 'is not valid' do
        message = Message.new(content: 'hola', created_at: DateTime.now)

        expect(message).to_not be_valid
      end
      it 'not valid withou associations' do
        message = Message.new(content: 'hola', created_at: DateTime.now)
        expect(message).to_not be_valid
      end
      it 'not valid without content' do
        message = Message.new(content: nil, created_at: DateTime.now)
        expect(message).to_not be_valid
      end
      it 'not valid without date' do
        message = Message.new(created_at: nil)
        expect(message).to_not be_valid
      end
    end
  end
end
