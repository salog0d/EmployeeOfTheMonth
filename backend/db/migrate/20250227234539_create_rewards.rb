class CreateRewards < ActiveRecord::Migration[8.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :type
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
