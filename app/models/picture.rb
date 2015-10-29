class Picture < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :album
  validates :avatar, presence: true
  validates_download_of(:avatar)
  validates :album_id, presence: true
end
