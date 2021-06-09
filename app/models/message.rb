class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :account
  belongs_to :room
end
