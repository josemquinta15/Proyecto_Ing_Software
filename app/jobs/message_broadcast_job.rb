# frozen_string_literal: true

# Message broadcaster
class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'home/message', locals: { message: message.content,
                                                                             datetime: message.created_at,
                                                                             msg_class: message,
                                                                             message_sent: true })
  end
end
