# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/message_email
  def message_email
   message_content = @message
    MessageMailer.message_email(message_content)
  end

end
