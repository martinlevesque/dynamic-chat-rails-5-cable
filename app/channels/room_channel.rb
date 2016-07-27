# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"

    #if params[:room].present?
    stream_from "room_channel_#{params[:room]}"
    @current_room = params[:room]
    #end

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'], room: data['room']
  end

  private
end
