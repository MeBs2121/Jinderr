class AddFirstnameToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :firstname, :string
  end
end
