# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'animal_requests/index', type: :view do
  before(:each) do
    assign(:animal_requests, [
             AnimalRequest.create!(
               name: 'Name',
               email: 'Email',
               animal: 'Animal',
               message: 'Message'
             ),
             AnimalRequest.create!(
               name: 'Name',
               email: 'Email',
               animal: 'Animal',
               message: 'Message'
             )
           ])
  end

  it 'renders a list of animal_requests' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Animal'.to_s, count: 2
    assert_select 'tr>td', text: 'Message'.to_s, count: 2
  end
end
