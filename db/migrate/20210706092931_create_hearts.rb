class CreateHearts < ActiveRecord::Migration[6.0]
  def change
    create_table :hearts do |t|
      t.integer :stock
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
