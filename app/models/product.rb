require 'acts-as-taggable-on'

class Product < ActiveRecord::Base
  belongs_to :user
  has_many   :images
  has_many   :likes, dependent: :destroy
  has_many   :comments
  has_many   :tags
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :catch_copy, :concept, :title,  presence: true
  def like_user(user)
   likes.find_by(user_id: user.id)
  end

  acts_as_ordered_taggable_on :products
  acts_as_taggable_on :tags
end

