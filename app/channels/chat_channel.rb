class ChatChannel < ApplicationCable::Channel
  delegate :ability, to: :connection
  before_action :find_channel_or_talk, only: :authorize_and_set_chat

  protected :ability

  def subscribed
    return unless authorize_and_set_chat

    stream_from "#{params[:team_id]}_#{params[:type]}_#{@record.id}"
  end

  def receive(data)
    @message = Message.new(body: data['message'], user: current_user)
    @record.messages << @message
  end

  private

  def authorize_and_set_chat
    ability.can? :red, @record
  end

  def find_channel_or_talk
    if params[:type] == 'channels'
      @record = Channel.find(params[:id])
    elsif params[:type] == 'talks'
      @record = Talk.find_by(user_one_id: [params[:id], current_user.id], user_two_id: [params[:id], current_user.id], team: params[:team_id])
    end
  end
end
