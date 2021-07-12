class Supporting < ApplicationRecord
  has_many :accounts
  validates :team, presence: true

  has_many :home_games, foreign_key: "home_id", class_name: "Event", dependent: :destroy
  # has_many :home_games, through: :home_events
  has_many :away_games, foreign_key: "away_id", class_name: "Event", dependent: :destroy
  # has_many :away_games, through: :away_events
end
