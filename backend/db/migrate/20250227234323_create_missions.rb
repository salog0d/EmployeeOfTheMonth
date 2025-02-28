class CreateMissions < ActiveRecord::Migration[8.0]
  def change
    create_table :missions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :instructions
      t.boolean :status

      t.timestamps
    end
  end
end
