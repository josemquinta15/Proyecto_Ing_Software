# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'animal_requests/new', type: :view do
  before(:each) do
    assign(:animal_request, AnimalRequest.new(
                              name: 'MyString',
                              email: 'MyString',
                              animal: 'MyString',
                              message: 'MyString'
                            ))
  end

  it 'renders new animal_request form' do
    render

    assert_select 'form[action=?][method=?]', animal_requests_path, 'post' do
      assert_select 'input[name=?]', 'animal_request[name]'

      assert_select 'input[name=?]', 'animal_request[email]'

      assert_select 'input[name=?]', 'animal_request[animal]'

      # assert_select 'input[name=?]', 'animal_request[message]'
    end
  end
end
