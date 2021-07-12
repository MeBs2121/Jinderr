class Event < ApplicationRecord
  belongs_to :home, class_name: "Supporting"
  belongs_to :away, class_name: "Supporting"
end
