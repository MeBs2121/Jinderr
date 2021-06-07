class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable

  # CarrierWave
  mount_uploader :photo, PhotoUploader

  #Supporting Team
  belongs_to :supporting, optional: true
  belongs_to :gender, optional: true

  # Gender
  has_many :interested_in_genders
  has_many :gender_interests, through: :interested_in_genders, source: :gender, dependent: :destroy

  # Matcing Relationships
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(account)
    following_relationships.find_by(following_id: account.id)
  end

  def follow!(account)
    following_relationships.create!(following_id: account.id)
  end

  def unfollow!(account)
    following_relationships.find_by(following_id: account.id).destroy
  end

  #友達判定
  def matchers
    followings & followers
  end

  # バリデーション
  validates :firstname,  presence: true, length: { maximum: 20 }
  validates :lastname,  presence: true, length: { maximum: 20 }
  validates :nickname,  presence: true, length: { maximum: 20 }
  validates :email, presence: true

end
