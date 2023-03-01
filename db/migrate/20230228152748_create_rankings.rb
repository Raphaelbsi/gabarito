class CreateRankings < ActiveRecord::Migration[7.0]
  def change
    create_table :rankings do |t|
      t.references :evidences, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.integer :points
      t.timestamps
    end
  end
end
