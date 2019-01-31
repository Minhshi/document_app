class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    @message_attachment = MessageAttachment.new
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: "messages/show", pdf: "Show", dpi: 300, page_size: 'Letter'}   # Excluding ".pdf" extension.
    end
  end

  def new
    @message = Message.new
    @message_attachment = MessageAttachment.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      # message_content = @message
      MessageMailer.message_email(@message).deliver_now
      # @message.send_message_email
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
