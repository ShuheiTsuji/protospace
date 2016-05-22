class Product < ActiveRecord::Base
  belongs_to :user
  has_many   :images
  has_many   :likes, dependent: :destroy
  has_many   :comments
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :catch_copy, :concept, :title,  presence: true
  def like_user(user)
   likes.find_by(user_id: user.id)
  end
end

