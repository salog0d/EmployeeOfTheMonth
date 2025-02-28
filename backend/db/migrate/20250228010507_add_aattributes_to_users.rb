class AddAttributesToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :score, :integer, default: 0
    add_column :users, :username, :string, unique: true
  end
end
