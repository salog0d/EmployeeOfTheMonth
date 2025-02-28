class LevelReward < ApplicationRecord
  belongs_to :level
  belongs_to :reward
end
