class AddLasttnameToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :lastname, :string
  end
end
