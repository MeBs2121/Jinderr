class AddLasttnameToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :lasttname, :string
  end
end
