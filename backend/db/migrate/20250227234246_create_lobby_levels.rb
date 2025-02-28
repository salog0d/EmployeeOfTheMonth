class CreateLobbyLevels < ActiveRecord::Migration[8.0]
  def change
    create_table :lobby_levels do |t|
      t.references :lobby, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
