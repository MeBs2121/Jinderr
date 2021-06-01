class Gender < ApplicationRecord
  has_many :accounts
  # has_many :interest_in_accounts, class_name: "InterestedInGender", foreign_key: "account_id"
end
