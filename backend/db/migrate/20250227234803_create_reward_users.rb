class CreateRewardUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :reward_users do |t|
      t.references :reward, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
