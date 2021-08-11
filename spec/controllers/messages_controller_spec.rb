# frozen_string_literal: true

require 'rails_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_message_url
    assert_response :success
  end

  test 'should get index' do
    get messages_url
    assert_response :success
  end

  test 'should get show' do
    get message_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_message_url
    assert_response :success
  end
end
