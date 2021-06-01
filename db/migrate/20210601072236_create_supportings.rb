class CreateSupportings < ActiveRecord::Migration[6.0]
  def change
    create_table :supportings do |t|
      t.string :team

      t.timestamps
    end
  end
end
