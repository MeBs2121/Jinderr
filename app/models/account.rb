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

  # dislike
  has_many :dislikes, foreign_key: "disliker_id", dependent: :destroy
  has_many :dislikings, through: "dislikes"


  #Chat Rooms
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries

  # new_matchings
  has_many :new_matchings, dependent: :destroy
  has_many :new_friends, through: :new_matchings, source: :friend

  #Heart
  has_one :heart

  def following?(other_account)
    # following_relationships.find_by(following_id: account.id)
    followings.include?(other_account)
  end

  def follow!(other_account)
    followings << other_account

    if other_account.following?(self)
      room = Room.create
      self.entries.create(room_id: room.id)
      other_account.entries.create(room_id: room.id)

      self.new_matchings.create(friend_id: other_account.id)
      other_account.new_matchings.create(friend_id: self.id)

      # メール送信
      binding.pry
      NoticeMailer.matching(self, other_account).deliver_now
    end

    self.heart.cut
  end

  def unfollow!(other_account)
    following_relationships.find_by(following_id: other_account.id).destroy
    if other_account.following?(self)
      room = (self.rooms & other_account.rooms)[0]
      room.destroy

      # self.new_matchings.find_by(friend_id: other_account.id).destroy
      # other_account.new_matchings.find_by(friend_id: self.id).destroy
    end
  end

  def dislike!(other_account)
    dislikings << other_account
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
