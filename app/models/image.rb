class Image < ActiveRecord::Base
  belongs_to :product
  enum role: {main: 1, thumbnail: 2}
end
