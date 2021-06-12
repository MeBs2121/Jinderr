class Gender < ApplicationRecord
  has_many :accounts
  has_many :interested_in_genders
  has_many :from_accounts, through: :interested_in_genders, source: :account, dependent: :destroy

  validates :name, presence: true
end
