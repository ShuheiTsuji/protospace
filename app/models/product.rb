class Product < ActiveRecord::Base
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images
  validates :catch_copy, :concept, :title,  presence: true
  mount_uploader :image, ImageUploader
end

