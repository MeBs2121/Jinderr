class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :home_id
      t.integer :away_id
      t.datetime :start_time

      t.timestamps
    end
    add_index :events, :home_id
    add_index :events, :away_id
  end
end
