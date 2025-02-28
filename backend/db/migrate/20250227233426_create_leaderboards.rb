class CreateLeaderboards < ActiveRecord::Migration[8.0]
  def change
    create_table :leaderboards do |t|
      t.integer :player
      t.integer :score

      t.timestamps
    end
  end
end
