class MessageAttachmentsController < ApplicationController
  def new
    @message = Message.find(params[:message_id])
    @message_attachment = MessageAttachment.new
  end
end
