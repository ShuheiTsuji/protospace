class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

<<<<<<< HEAD
  validates :name,                      presence: true, length: { maximum: 6 }
  validates :member, :profile, :works,  presence: true
=======
  validates :name, presence: true, length: { maximum: 6 }
  validates :member, presence: true
  validates :profile, presence: true
  validates :works, presence: true
>>>>>>> parent of 54e3e5f... create controller function and index.html.haml

  has_many :products
end

