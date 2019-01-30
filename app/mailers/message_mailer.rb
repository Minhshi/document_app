class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_email.subject
  #
  def message_email(message_content)
    @message = message_content
    mail to: "mpham@naver.com", subject: "New Message"
  end
end
