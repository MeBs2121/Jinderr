class CreateDislikes < ActiveRecord::Migration[6.0]
  def change
    create_table :dislikes do |t|
      t.integer :disliker_id
      t.integer :disliking_id

      t.timestamps
    end
    add_index :dislikes, :disliker_id
    add_index :dislikes, :disliking_id
    add_index :dislikes, [:disliker_id, :disliking_id], unique: true
  end
end
