class Category < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  has_many :products

  mount_uploader :image, CategoryImageUploader
  
end
