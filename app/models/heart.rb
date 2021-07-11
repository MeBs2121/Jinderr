class Heart < ApplicationRecord
  belongs_to :account

  validates :stock, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}

  def reset
    update(stock: 5)
  end

  def cut
    update(stock: stock - 1)
  end
end
