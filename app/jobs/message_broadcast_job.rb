class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    m = message.messageable
    chat = m.class == Channel ? "#{m.team.id}_channels_#{m.id}" : "#{m.team.id}_talks_#{m.id}"
    ActionCable.server.broadcast(chat, {
                                   message: message.body,
                                   date: message.created_at.strftime('%d/%m/%y'),
                                   name: message.user.name
                                 })
  end
end
