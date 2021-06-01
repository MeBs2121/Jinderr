class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable
  mount_uploader :photo, PhotoUploader

  belongs_to :supporting
  belongs_to :gender

  has_many :interest_in_genders, class_name: "InterestedInGender", foreign_key: "gender_id"

end
