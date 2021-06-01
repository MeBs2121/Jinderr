class InterestedInGender < ApplicationRecord
  belongs_to :account
  belongs_to :gender
end
