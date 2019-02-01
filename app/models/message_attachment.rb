class MessageAttachment < ApplicationRecord
  belongs_to :message
  mount_uploader :attachment, PhotoUploader
end
