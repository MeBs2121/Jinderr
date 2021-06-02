class Gender < ApplicationRecord
  has_many :accounts
  has_many :interested_in_genders

end
