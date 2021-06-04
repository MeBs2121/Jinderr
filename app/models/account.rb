class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable
  mount_uploader :photo, PhotoUploader

  belongs_to :supporting, optional: true
  belongs_to :gender, optional: true

  has_many :interested_in_genders
  has_many :gender_interests, through: :interested_in_genders, source: :gender, dependent: :destroy

  validates :firstname,  presence: true, length: { maximum: 20 }
  validates :lastname,  presence: true, length: { maximum: 20 }
  validates :nickname,  presence: true, length: { maximum: 20 }
  validates :email, presence: true

end
