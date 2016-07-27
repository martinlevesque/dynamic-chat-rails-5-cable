class RoomsController < ApplicationController
  def show
    @room = params[:room]
    raise "needs room" if @room.blank?

    @messages = Message.where(room: @room)
  end
end
