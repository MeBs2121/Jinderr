class AddGenderrefToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_reference :accounts, :gender, foreign_key: true
  end
end
