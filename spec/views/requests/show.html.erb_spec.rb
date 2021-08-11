# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'requests/show', type: :view do
  before(:each) do
  end

  it 'request valid' do
    user = User.create(email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678',
                       last_name: 'Quintana', first_name: 'José Miguel', phone: '997764456', city: 'Santiago',
                       gender: 'M')
    user1 = User.create(email: 'test2@gmail.com', password: '12345678', password_confirmation: '12345678',
                        last_name: 'Zaror', first_name: 'Vicente', phone: '996642258', city: 'Santiago', gender: 'M')
    post = Post.create(title: 'golden retriever', text: 'description', price: '230.000', level: '1', animal: 'Dog',
                       ptype: 'Sell', location: 'Santiago', user_id: user.id, date: DateTime.now)
    @request = assign(:request, Request.create!(
                                  reviewed_own: 2,
                                  reviewed_buy: 34,
                                  post_id: post.id,
                                  owner_id: user.id,
                                  buyer_id: user1.id,
                                  state: false,
                                  chid: 5
                                ))
    expect(@request).to be_valid
  end

  it 'invalid empty request' do
    @request = Request.create
    expect(@request).to_not be_valid
  end
end
