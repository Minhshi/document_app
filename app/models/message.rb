class Message < ApplicationRecord
  after_create :send_message_email, only: [:create]
  belongs_to :user
  has_many :message_attachments
  # accepts_nested_attributes_for :message_attachments

  validates :topic, presence: true
  validates :description, presence: true

  mount_uploader :photo, PhotoUploader
end

private

def send_message_email
  MessageMailer.message_email(self).deliver_now
end
