class CreateLobbies < ActiveRecord::Migration[8.0]
  def change
    create_table :lobbies do |t|
      t.text :description

      t.timestamps
    end
  end
end
