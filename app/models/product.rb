class Product < ActiveRecord::Base
  validates :title, :price, :image, presence: true, uniqueness: true
  validates :image, allow_blank: true, format: {
  with: %r{\.(gif|jpg|png)\Z}i,
  message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  belongs_to :category
  has_many :line_items, dependent: :destroy

  mount_uploader :image, ProductImageUploader

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
