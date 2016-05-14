class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :products

  validates :name,                      presence: true, length: { maximum: 6 }
  validates :member, :profile, :works,  presence: true

  mount_uploader :avatar, AvatarUploader
end

