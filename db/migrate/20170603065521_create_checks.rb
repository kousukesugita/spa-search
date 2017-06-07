class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.references :user, foreign_key: true
      t.references :spa, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :spa_id], unique: true
    end
  end
end
