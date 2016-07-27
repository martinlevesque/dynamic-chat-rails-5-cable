class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message_obj)
    ActionCable.server.broadcast "room_channel_#{message_obj.room}", message: render_message(message_obj)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
