class MessageAttachment < ApplicationRecord
  belongs_to :message
  mount_uploader :photo, PhotoUploader
end
