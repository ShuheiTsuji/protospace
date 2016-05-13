class Image < ActiveRecord::Base
  belongs_to :product
<<<<<<< HEAD
  enum role: %i(main sub)
  mount_uploader :image, ImageUploader
=======
  enum role: {main: 1, sub: 2}
>>>>>>> parent of 54e3e5f... create controller function and index.html.haml
end




