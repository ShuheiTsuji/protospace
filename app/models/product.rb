class Product < ActiveRecord::Base
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images
  mount_uploader :image, ImageUploader
end

