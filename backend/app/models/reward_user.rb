class RewardUser < ApplicationRecord
  belongs_to :reward
  belongs_to :user
end
