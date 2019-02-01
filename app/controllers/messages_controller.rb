class MessagesController < ApplicationController
  def index
    # @messages = Message.all
    @messages = policy_scope(Message)
  end

  def show
    @message = Message.find(params[:id])
    authorize @message
    @message_attachments = @message.message_attachments.all
    # @message_attachment = MessageAttachment.new
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: "messages/show", pdf: "Show", dpi: 300, page_size: 'Letter'}   # Excluding ".pdf" extension.
    end
  end

  def new
    @message = Message.new
    @message_attachment = @message.message_attachments.build
    # @message_attachment = MessageAttachment.new
    authorize @message
    authorize @message_attachment
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    authorize @message
    if @message.save
      params[:message_attachments]['attachment'].each do |a|
        @message_attachment = @message.message_attachments.create!(:attachment => a)
      end
      message_content = @message
      MessageMailer.message_email(message_content).deliver_now
      redirect_to messages_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:topic, :description, message_attachments_attributes: [:id, :message_id, :attachment])
  end
end
