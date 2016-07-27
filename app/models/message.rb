class Message < ApplicationRecord

  validates_presence_of :room

  after_create_commit { MessageBroadcastJob.perform_later self }
end
