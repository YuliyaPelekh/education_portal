class Material < ActiveRecord::Base 
  mount_uploader :video, VideoUploader  
  validates :name, presence: true
  validates :sort, presence: true
  validates :video, presence: true
  
  def video?
  	self.sort == 'video'
  end

  def audio?
    self.sort == 'audio'
  end

end
