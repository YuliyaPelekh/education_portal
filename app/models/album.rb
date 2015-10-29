class Album < ActiveRecord::Base
  validates :title, presence: true                  
  validates :description, length: { minimum: 10 }
  has_many :pictures, dependent: :destroy
end
