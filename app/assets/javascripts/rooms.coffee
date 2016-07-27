# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  App.room = App.cable.subscriptions.create {channel: "RoomChannel", room: g_room_name},
    connected: ->
  # Called when the subscription is ready for use on the server

    disconnected: ->
  # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#messages').append data['message']
  # Called when there's incoming data on the websocket for this channel

    speak: (message, room) ->
      @perform 'speak', message: message, room: room

$ ->
  $("#message").keydown (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak event.target.value, g_room_name
      event.target.value = ""
      event.preventDefault()
