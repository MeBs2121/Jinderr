class NewMatching < ApplicationRecord
  belongs_to :account, class_name: "Account"
  belongs_to :friend, class_name: "Account"
end
