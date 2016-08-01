class Image < ActiveRecord::Base
  belongs_to :product
  enum role: %i(main sub)
  mount_uploader :image, ImageUploader

  validates :image, :role,  presence: true
end

