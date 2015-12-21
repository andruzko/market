class Category < ActiveRecord::Base
  validates :title, :image, presence: true, uniqueness: true
  validates :image, allow_blank: true, format: {
  with: %r{\.(gif|jpg|png)\Z}i,
  message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
}

  has_many :products

  mount_uploader :image, CategoryImageUploader
  
end
