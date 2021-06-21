class Dislike < ApplicationRecord
  belongs_to :disliker, class_name: "Account"
  belongs_to :disliking, class_name: "Account"
end
