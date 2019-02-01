class Message < ApplicationRecord
  # after_create :send_message_email, only: [:create]
  belongs_to :user
  has_many :message_attachments
  accepts_nested_attributes_for :message_attachments

  validates :topic, presence: true
  validates :description, presence: true

  mount_uploader :photo, PhotoUploader
  # after_save :check_metadata

  #  def check_metadata
  #   if self.photo.present? && self.photo.metadata.present?
  #     exif = self.photo.metadata["photo_metadata"]
  #     # ...
  #   end
  # end
end

# private

# def send_message_email
#   MessageMailer.message_email(self).deliver_now
# end
