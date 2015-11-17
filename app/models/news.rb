class News < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true,
                    length: { minimum: 10 }
  has_many :images, dependent: :destroy
end
