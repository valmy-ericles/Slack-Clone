class CreateTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :talks do |t|
      t.integer :user_one_id
      t.integer :user_two_id
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
