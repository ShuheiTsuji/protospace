class Image < ActiveRecord::Base
  belongs_to :product
  enum role: %i(main sub)
  mount_uploader :image, ImageUploader

  validates :image,  presence: true
end

