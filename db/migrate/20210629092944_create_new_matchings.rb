class CreateNewMatchings < ActiveRecord::Migration[6.0]
  def change
    create_table :new_matchings do |t|
      t.integer :account_id
      t.integer :friend_id

      t.timestamps
    end
    add_index :new_matchings, :account_id
    add_index :new_matchings, :friend_id
  end
end
