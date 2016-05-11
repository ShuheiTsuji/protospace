class Product < ActiveRecord::Base
  belongs_to :user
  has_many   :images
  accepts_nested_attributes_for :images

  validates :catch_copy,  presence: true
  validates :concept,     presence: true
  validates :title,       presence: true
end

