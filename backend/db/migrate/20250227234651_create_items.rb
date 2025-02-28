class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.text :description
      t.text :best_practice

      t.timestamps
    end
  end
end
