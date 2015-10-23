class Image < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :news
  validates :avatar, presence: true
end
