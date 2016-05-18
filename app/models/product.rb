class Product < ActiveRecord::Base
  belongs_to :user
  has_many   :images
  has_many   :likes, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :catch_copy, :concept, :title,  presence: true
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end

