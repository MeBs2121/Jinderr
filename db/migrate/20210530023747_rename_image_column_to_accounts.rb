class RenameImageColumnToAccounts < ActiveRecord::Migration[6.0]
  def change
    rename_column :accounts, :image, :photo
  end
end
