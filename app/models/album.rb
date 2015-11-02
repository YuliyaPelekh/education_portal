class Album < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 15 }                 
  validates :description, length: { minimum: 10 }, allow_blank: true
  has_many :pictures, dependent: :destroy
end
