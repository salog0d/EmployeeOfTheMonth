class CreateUserLeaderboards < ActiveRecord::Migration[8.0]
  def change
    create_table :user_leaderboards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :leaderboard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
