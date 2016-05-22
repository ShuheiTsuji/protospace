class Comment < ActiveRecord::Base
  belongs_to    :product
  belongs_to    :user
  validates     :text, presence: true
end
