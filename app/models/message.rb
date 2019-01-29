class Message < ApplicationRecord
  belongs_to :user
  has_many :message_attachments
  # accepts_nested_attributes_for :message_attachments

  validates :topic, presence: true
  validates :description, presence: true

  mount_uploader :photo, PhotoUploader
end
