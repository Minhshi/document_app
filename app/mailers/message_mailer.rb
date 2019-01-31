class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_email.subject
  #
  def message_email(message_content)
    @message = message_content
    # attachments.inline['photo.png'] = File.read('path/to/photo.png')
    mail(to: "mpham@naver.com", subject: "New Message")
    # mail.attachments['logo.png'] = File.read('app/assets/images/logo.png')
    mail.attachments['attachment.pdf'] = WickedPdf.new.pdf_from_string(
      render_to_string(:pdf => "show",:template => 'messages/show.pdf.erb')
      )
  end
end
