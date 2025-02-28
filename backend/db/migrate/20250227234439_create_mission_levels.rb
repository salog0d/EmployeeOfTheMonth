class CreateMissionLevels < ActiveRecord::Migration[8.0]
  def change
    create_table :mission_levels do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
