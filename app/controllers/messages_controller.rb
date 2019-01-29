class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    @message_attachment = MessageAttachment.new
  end

  def new
    @message = Message.new
    @message_attachment = MessageAttachment.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:topic, :description, :photo)
  end
end
