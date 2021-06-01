class CreateInterestedInGenders < ActiveRecord::Migration[6.0]
  def change
    create_table :interested_in_genders do |t|
      t.references :account, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
