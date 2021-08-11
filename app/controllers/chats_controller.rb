# frozen_string_literal: true

# Chat Controller
class ChatsController < ApplicationController
  def show
    # @messages = Message.all
    if !@selected_chat && user_signed_in?
      last_chat = current_user.ordered_chats.first
      # @messages = last_chat.messages
      @selected_chat = last_chat
    else
      @selected_chat = nil
    end
  end

  def change_active_chat
    @selected_chat = current_user.chats.find(params[:chat_id])
    render chats_show_path, notice: 'Success'
  end
end
