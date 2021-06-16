class MessagesController < ApplicationController
  def index
    messages=Message.all
    render json: message
  end

  def create
    mesage= Message.new(message_params)
    if message.save
      ActionCable.server.broadcast 'messages_channel'
      head:ok
    else
      head:ok  
  end
end
private

def mesage_params
  params.require(:message).permit(:content)
  end 
end