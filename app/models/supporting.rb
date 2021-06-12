class Supporting < ApplicationRecord
  has_many :accounts
  validates :team, presence: true
end
