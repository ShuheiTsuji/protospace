class Image < ActiveRecord::Base
  belongs_to :product
  enum role: {main: 1, sub: 2}
  mount_uploader :image, ImageUploader
end

