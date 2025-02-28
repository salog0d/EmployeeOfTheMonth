class CreateLevelRewards < ActiveRecord::Migration[8.0]
  def change
    create_table :level_rewards do |t|
      t.references :level, null: false, foreign_key: true
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
