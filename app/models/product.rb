require 'acts-as-taggable-on'

class Product < ActiveRecord::Base
  belongs_to :user
  has_many   :images
  has_many   :likes, dependent: :delete_all
  has_many   :comments, dependent: :delete_all

  has_many   :tags
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :catch_copy, :concept, :title,  presence: true

  acts_as_ordered_taggable_on :products
  acts_as_taggable_on :tags

  def like_user(user)
   likes.find_by(user_id: user.id)
  end


end

