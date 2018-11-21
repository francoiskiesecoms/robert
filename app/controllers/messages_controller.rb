class MessagesController < ApplicationController



def create
  @message = Message.new(message_params)
  @chat_room = ChatRoom.find(params[:chat_room_id])
  @message.chat_room = @chat_room
  @message.user = current_user
  @message.save
  # if @message.save
  #   ActionCable.server.broadcast("chat_room_#{@chat_room.id}",{
  #     message: @message.to_json
  #   })
  #   respond_to do |format|
  #     format.html { redirect_to chat_room_path(@chat_room)}
  #     format.js
  #   end
  # else
  #   respond_to do |format|
  #     format.html { render "chat_rooms/show"}
  #     format.js
  #   end
  end

  def index
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @messages = @chat_room.messages
  end



  private
  def message_params
    params.require(:message).permit(:content)
  end
end
