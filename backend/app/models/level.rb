class Level < ApplicationRecord
  has_many :lobby_levels
  has_many :lobbies, through: :lobby_levels
  has_many :mission_levels
  has_many :missions, through: :mission_levels
  has_many :level_rewards
  has_many :rewards, through: :level_rewards
end
