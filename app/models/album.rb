class Album < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 20 }                 
  has_many :pictures, dependent: :destroy
end
