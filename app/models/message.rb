class Message < ApplicationRecord
  belongs_to :user

  validates :topic, presence: true
  validates :description, presence: true

  mount_uploader :photo, PhotoUploader
end
