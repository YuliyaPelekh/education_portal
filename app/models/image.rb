class Image < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :news
  validates :avatar, presence: true
  validates_download_of(:avatar)
  validates :news_id, presence: true
end
