class CreateInventories < ActiveRecord::Migration[8.0]
  def change
    create_table :inventories do |t|
      t.references :item, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
