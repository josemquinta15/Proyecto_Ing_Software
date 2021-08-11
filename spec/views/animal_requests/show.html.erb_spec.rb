# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'animal_requests/show', type: :view do
  before(:each) do
    @animal_request = assign(:animal_request, AnimalRequest.create!(
                                                name: 'Name',
                                                email: 'Email',
                                                animal: 'Animal',
                                                message: 'Message'
                                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Animal/)
    expect(rendered).to match(/Message/)
  end
end
