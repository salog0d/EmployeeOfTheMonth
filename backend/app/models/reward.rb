class Reward < ApplicationRecord
  has_many :level_rewards
  has_many :levels, through: :level_rewards
  has_many :reward_users
  has_many :users, through: :reward_users
end
