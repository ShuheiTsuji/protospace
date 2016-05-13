class Product < ActiveRecord::Base
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images
<<<<<<< HEAD

  validates :catch_copy, :concept, :title,  presence: true
=======
  mount_uploader :image, ImageUploader
>>>>>>> parent of 54e3e5f... create controller function and index.html.haml
end

