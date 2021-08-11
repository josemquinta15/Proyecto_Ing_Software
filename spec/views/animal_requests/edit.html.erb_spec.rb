# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'animal_requests/edit', type: :view do
  before(:each) do
    @animal_request = assign(:animal_request, AnimalRequest.create!(
                                                name: 'MyString',
                                                email: 'MyString',
                                                animal: 'MyString',
                                                message: 'MyString'
                                              ))
  end

  it 'renders the edit animal_request form' do
    render

    assert_select 'form[action=?][method=?]', animal_request_path(@animal_request), 'post' do
      assert_select 'input[name=?]', 'animal_request[name]'

      assert_select 'input[name=?]', 'animal_request[email]'

      assert_select 'input[name=?]', 'animal_request[animal]'

      # assert_select 'input[name=?]', 'animal_request[message]'
    end
  end
end
